import 'package:chuva/app/core/widgets/app_bar_custom.dart';
import 'package:flutter/material.dart';

class ActivitePage extends StatelessWidget {
  const ActivitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(
        actions: [],
      ),
      body: Container(),
    );
  }
}
