import 'package:chuva/app/core/models/activite_model.dart';
import 'package:chuva/app/core/store/notifier_store.dart';

class ActivitiesStore extends StoreNotifier<List<ActiviteModel>> {
  ActivitiesStore() : super([]);

  void addActivites(List<ActiviteModel> activities) {
    dispatch(activities);
  }
}
