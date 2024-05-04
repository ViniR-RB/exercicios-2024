import 'dart:convert';
import 'dart:developer';

import 'package:chuva/app/core/eiither/either.dart';
import 'package:chuva/app/core/exceptions/repository_exception.dart';
import 'package:chuva/app/core/models/activite_model.dart';
import 'package:chuva/app/core/restClient/rest_client.dart';
import 'package:dio/dio.dart';

import './activities_repository.dart';

class ActivitiesRepositoryImpl implements ActivitiesRepository {
  final RestClient _restClient;
  ActivitiesRepositoryImpl(this._restClient);
  @override
  Future<Either<RepositoryException, List<ActiviteModel>>>
      getActivities() async {
    try {
      final Response(:data) = await _restClient.get("/activities.json");
      final jsonDataList = jsonDecode(data)["data"] as List;
      final activities =
          jsonDataList.map((e) => ActiviteModel.fromMap(e)).toList();

      return Success(activities);
    } on DioException catch (e, s) {
      const message = "Erro ao buscar as atividades";
      log(message, error: e, stackTrace: s);
      return Failure(RepositoryException(message));
    }
  }
}
