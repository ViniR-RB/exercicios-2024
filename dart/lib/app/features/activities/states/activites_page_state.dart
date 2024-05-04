import 'package:chuva/app/core/models/activite_model.dart';

sealed class ActivitesPageState {}

final class ActivitesPageInitialState extends ActivitesPageState {}

final class ActivitesPageLoadingState extends ActivitesPageState {}

final class ActivitesPageLoadedState extends ActivitesPageState {
  final List<ActiviteModel> activities;
  ActivitesPageLoadedState(this.activities);
}

final class ActivitesPageEmptyState extends ActivitesPageLoadedState {
  ActivitesPageEmptyState() : super([]);
}

final class ActivitesPageErrorState extends ActivitesPageState {
  final String message;
  ActivitesPageErrorState(this.message);
}
