import 'package:chuva/app/features/activities/store/activities_store.dart';

class ActivitiesController {
  final ActivitiesStore _store;
  ActivitiesController(this._store);

  void getAllActivities() {
    _store.getAllActivities();
  }

  ActivitiesStore get store => _store;
}
