import 'package:chuva/app/core/extensions/css_from_color.extension.dart';
import 'package:flutter/material.dart';

class ActiviteCategoryModel {
  final int id;
  final String title;
  final Color color;
  final Color backGroundColor;

  ActiviteCategoryModel({
    required this.id,
    required this.title,
    required this.color,
    required this.backGroundColor,
  });

  factory ActiviteCategoryModel.fromMap(Map map) {
    return switch (map) {
      {
        "id": final int id,
        "title": final Map title,
        "color": final String? color,
        "background-color": final String? backGroundColor,
      } =>
        ActiviteCategoryModel(
            id: id,
            title: title["pt-br"],
            color: color?.cssFromColor() ?? const Color(0xFFfb8c2c),
            backGroundColor:
                backGroundColor?.cssFromColor() ?? const Color(0xFFFEFEFE)),
      _ => throw ArgumentError(
          'Erro ao formatar o json para ActiviteCategoryModel')
    };
  }
}
