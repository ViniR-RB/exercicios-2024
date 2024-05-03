import 'dart:async';
import 'dart:developer';

import 'package:chuva/app/app_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(
    () => runApp(const AppWidget()),
    (error, stack) => log("Erro inesperado", error: error, stackTrace: stack),
  );
}
