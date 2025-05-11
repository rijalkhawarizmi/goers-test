import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:goers_test/species/domain/entities/species_entity.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../domain/usecases/species_usecase.dart';

part 'species_event.dart';
part 'species_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class SpeciesBloc extends Bloc<SpeciesEvent, SpeciesState> {
  SpeciesBloc({required SpeciesUsecase speciesUsecase})
    : _speciesUsecase = speciesUsecase,
      super(SpeciesState()) {
    on<SpeciesEvent>(_getListSpecies,transformer: droppable());
  }

  final SpeciesUsecase _speciesUsecase;
  int _page = 1;
  final int _limit = 10;

  Future<void> _getListSpecies(
    SpeciesEvent event,
    Emitter<SpeciesState> emit,
  ) async {
    if (event.isRefresh) {
      _page = 1;
      emit(state.copyWith(speciesEntity: [], hasReachMax: false));
    }
    if (state.hasReachMax) return;

    final result = await _speciesUsecase(SpeciesParams(page: _page));
    result.fold(
      (failure) async {
        emit(
          state.copyWith(
            status: SpeciesStatus.failure,
            message: failure.errorMessage,
          ),
        );
      },
      (data) async {
        if (data.isEmpty) {
          return emit(
            state.copyWith(hasReachMax: true, status: SpeciesStatus.success),
          );
        }
        _page++;
        emit(
          state.copyWith(
            hasReachMax: data.length < _limit ? true : false,
            status: SpeciesStatus.success,
            speciesEntity: [...state.speciesEntity, ...data],
          ),
        );
      },
    );
  }
}
