import 'package:get_it/get_it.dart';
import 'package:goers_test/species/data/datasources/species_remote_data_source.dart';
import 'package:goers_test/species/presentation/bloc/species_bloc.dart';

import '../../species/data/repositories/species_repository_implementation.dart';
import '../../species/domain/repositories/species_repository.dart';
import '../../species/domain/usecases/species_usecase.dart';
import '../config/api_services.dart';

final sl = GetIt.instance;
// ApiServices _apiServices = ApiServices();

Future<void> init() async {
  sl.registerFactory(() => ApiServices());
  sl.registerFactory(() => SpeciesBloc(speciesUsecase: sl()));
  sl.registerLazySingleton(() => SpeciesUsecase(sl()));

  sl.registerLazySingleton<SpeciesRepository>(
    () => SpeciesRepositoryImplementation(sl()),
  );

    sl.registerLazySingleton<SpeciesRemoteDataSource>(
      () => SpeciesRemoteDataSrcImpl(sl()));
}
