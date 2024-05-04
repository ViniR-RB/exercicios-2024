import 'package:chuva/app/core/restClient/rest_client.dart';
import 'package:chuva/app/features/activities/controller/activities_controller.dart';
import 'package:chuva/app/features/activities/pages/activite_page.dart';
import 'package:chuva/app/features/activities/repository/activities_repository_impl.dart';
import 'package:chuva/app/features/activities/store/activites_page_store.dart';
import 'package:chuva/app/features/activities/store/activities_store.dart';
import 'package:chuva/app/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

sealed class Routes {
  static String initialRoute = "/";
  static String activitiesRoute = "${initialRoute}activities";

  static final GoRouter _router = GoRouter(
    initialLocation: initialRoute,
    routes: [
      GoRoute(
          path: initialRoute,
          builder: (_, __) {
            return const SplashPage();
          },
          routes: const []),
      GoRoute(
          path: activitiesRoute,
          builder: (_, __) {
            return ActivitePage(
              controller: ActivitiesController(ActivitiesStore(),
                  ActivitePageStore(), ActivitiesRepositoryImpl(RestClient())),
            );
          }),
    ],
  );

  static GoRouter get router => _router;
}
