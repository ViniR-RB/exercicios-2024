import 'package:chuva/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;

  const AppBarCustom({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text("Chuva 💜 Flutter", style: AppTheme.titleStyle),
          Text("Progamação",
              style: AppTheme.titleStyle.copyWith(fontWeight: FontWeight.w300))
        ],
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
