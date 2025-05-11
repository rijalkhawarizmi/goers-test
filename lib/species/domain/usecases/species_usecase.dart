// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import '../../../core/usecase/usecase.dart';
import '../../../core/utils/typedef.dart';
import '../entities/species_entity.dart';
import '../repositories/species_repository.dart';

class SpeciesUsecase extends UsecaseWithParams<void,SpeciesParams> {
  
const SpeciesUsecase(this._repository);

final SpeciesRepository _repository;

// TODO: Implement Species usecase
  @override
  ResultFuture<List<SpeciesEntity>> call(SpeciesParams params) {
    // TODO: implement call Species
    
    return _repository.getSpecies(params: params);
    
  }
  
}



class SpeciesParams extends Equatable {

  SpeciesParams({required this.page});
  final int page;

  @override
  List<Object> get props => [page];
}
