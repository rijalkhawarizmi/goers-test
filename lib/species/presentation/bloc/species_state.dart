// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'species_bloc.dart';

enum SpeciesStatus {loading,success,failure}

class SpeciesState extends Equatable {
  const SpeciesState({this.status=SpeciesStatus.loading,this.speciesEntity=const [],this.hasReachMax=false,this.message=""});

  final SpeciesStatus status;
  final List<SpeciesEntity> speciesEntity;
  final bool hasReachMax;
  final String message;
  
  @override
  List<Object> get props => [status,speciesEntity,hasReachMax,message];

  SpeciesState copyWith({
    SpeciesStatus? status,
    List<SpeciesEntity>? speciesEntity,
    bool? isLoadingFirst,
    bool? hasReachMax,
    String? message,
  }) {
    return SpeciesState(
      status: status ?? this.status,
      speciesEntity: speciesEntity ?? this.speciesEntity,
      hasReachMax: hasReachMax ?? this.hasReachMax,
      message: message ?? this.message,
    );
  }
}

