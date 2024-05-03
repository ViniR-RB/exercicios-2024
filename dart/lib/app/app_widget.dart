import 'package:chuva/app/core/routes/routes.dart';
import 'package:chuva/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Chuva App',
      theme: AppTheme.theme,
      routerConfig: Routes.router,
      locale: const Locale('pt', 'BR'),
      localizationsDelegates:
          FlutterLocalization.instance.localizationsDelegates,
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
    );
  }
}
