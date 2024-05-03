import 'package:chuva/app/features/activities/pages/activite_page.dart';
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
            return const ActivitePage();
          }),
    ],
  );

  static GoRouter get router => _router;
}
