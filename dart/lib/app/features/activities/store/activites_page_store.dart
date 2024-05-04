import 'package:chuva/app/core/models/activite_model.dart';
import 'package:chuva/app/core/store/notifier_store.dart';
import 'package:chuva/app/features/activities/states/activites_page_state.dart';

class ActivitePageStore extends StoreNotifier<ActivitesPageState> {
  ActivitePageStore() : super(ActivitesPageInitialState());

  void loading() {
    dispatch(ActivitesPageLoadingState());
  }

  void loaded(List<ActiviteModel> activities) {
    dispatch(ActivitesPageLoadedState(activities));
  }

  void empty() {
    dispatch(ActivitesPageEmptyState());
  }

  void error(String message) {
    dispatch(ActivitesPageErrorState(message));
  }
}
