import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _init() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => context.go("/activities"));
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("Chuva"),
    ));
  }
}
