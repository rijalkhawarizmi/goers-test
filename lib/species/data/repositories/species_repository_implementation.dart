
import '../../../core/utils/typedef.dart';
import '../../domain/entities/species_entity.dart';
import '../../domain/repositories/species_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/usecases/species_usecase.dart';
import '../datasources/species_remote_data_source.dart';

class SpeciesRepositoryImplementation extends SpeciesRepository {
  SpeciesRepositoryImplementation(this._speciesRemoteDataSource);

  final SpeciesRemoteDataSource _speciesRemoteDataSource; 

  @override
  ResultFuture<List<SpeciesEntity>> getSpecies({required SpeciesParams params}) async {
    
    try {
      List<SpeciesEntity> speciesEntity = await _speciesRemoteDataSource.getSpecies(params: params);
      return Right(speciesEntity);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
 
}

