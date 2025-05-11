import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/config/api_services.dart';
import '../../../core/errors/exceptions.dart';
import '../../domain/usecases/species_usecase.dart';
import '../models/species_model.dart';

abstract class SpeciesRemoteDataSource {
  Future<List<SpeciesModel>> getSpecies({required SpeciesParams params});
}

class SpeciesRemoteDataSrcImpl implements SpeciesRemoteDataSource {
  // TODO: Implement SpeciesRemoteDataSource

  SpeciesRemoteDataSrcImpl(this._apiServices);

  final ApiServices _apiServices;

  @override
  Future<List<SpeciesModel>> getSpecies({required SpeciesParams params}) async {
    try {
     
      final response = await _apiServices.getRequest(
        path: "/species?page=${params.page}",
      );

      if (response.statusCode == 200) {
        return response.data["results"]
            .map<SpeciesModel>((e) => SpeciesModel.fromJson(e))
            .toList();
      } else {
        throw ApiException(response);
      }
    } on DioException catch (e) {
      throw ApiException(e);
    }
  }
}
