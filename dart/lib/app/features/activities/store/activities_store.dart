import 'package:chuva/app/core/eiither/either.dart';
import 'package:chuva/app/core/exceptions/repository_exception.dart';
import 'package:chuva/app/core/models/activite_model.dart';
import 'package:chuva/app/core/store/notifier_store.dart';
import 'package:chuva/app/features/activities/repository/activities_repository.dart';

class ActivitiesStore extends StoreNotifier<List<ActiviteModel>> {
  final ActivitiesRepository _repository;
  ActivitiesStore(this._repository) : super([]);



  getAllActivities() async {
    final result = await _repository.getActivities();
    switch (result) {
      case Success(value: final activiteList):
        dispatch(activiteList);
      case Failure(error: RepositoryException(message: final String message)):
        print(message);
    }
  }
}
