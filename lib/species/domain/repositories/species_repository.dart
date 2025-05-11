
import 'package:goers_test/species/domain/usecases/species_usecase.dart';

import '../../../core/utils/typedef.dart';
import '../entities/species_entity.dart';

abstract class SpeciesRepository {
  // TODO: Define SpeciesRepository interface

 const SpeciesRepository();

 ResultFuture<List<SpeciesEntity>> getSpecies({required SpeciesParams params});

}
