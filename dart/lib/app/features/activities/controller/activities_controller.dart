import 'package:chuva/app/core/eiither/either.dart';
import 'package:chuva/app/core/exceptions/repository_exception.dart';
import 'package:chuva/app/features/activities/repository/activities_repository.dart';
import 'package:chuva/app/features/activities/store/activites_page_store.dart';
import 'package:chuva/app/features/activities/store/activities_store.dart';

class ActivitiesController {
  final ActivitiesStore _store;
  final ActivitePageStore _activitePageStore;

  final ActivitiesRepository _repository;

  ActivitiesController(this._store, this._activitePageStore, this._repository);

  Future<void> getAllActivities() async {
    _activitePageStore.loading();
    final result = await _repository.getActivities();

    switch (result) {
      case Success(value: final value):
        _activitePageStore.loaded(value);
        _store.addActivites(value);
      case Failure(error: RepositoryException(message: final message)):
        _activitePageStore.error(message);
    }
  }

  ActivitePageStore get pageStore => _activitePageStore;

  void filtiringActivitesByDay(int day) {
    String paddedDay = day.toString().padLeft(2, '0');
    final activites = _store.state;
    final activitesFiltering = activites
        .where((element) => element.start.substring(8, 10).contains(paddedDay))
        .toList();
    activitesFiltering.isEmpty
        ? _activitePageStore.empty()
        : _activitePageStore.loaded(activitesFiltering);
  }
}
