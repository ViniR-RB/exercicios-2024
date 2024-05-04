import 'dart:convert';

import 'package:chuva/app/core/models/activite_category_model.dart';

class ActiviteModel {
  final int id;
  final int changed;
  final String start;
  final String end;
  final String title;
  final ActiviteCategoryModel activiteCategory;
  final String type;
  ActiviteModel({
    required this.id,
    required this.changed,
    required this.start,
    required this.end,
    required this.title,
    required this.type,
    required this.activiteCategory,
  });

  factory ActiviteModel.fromMap(Map map) {
    return switch (map) {
      {
        "id": final int id,
        "changed": final int changed,
        "start": final String start,
        "end": final String end,
        "title": final Map title,
        "type": final Map type,
        "category": final Map category,
      } =>
        ActiviteModel(
            id: id,
            changed: changed,
            start: start,
            end: end,
            title: title["pt-br"],
            type: type["title"]["pt-br"],
            activiteCategory: ActiviteCategoryModel.fromMap(category)),
      _ => throw ArgumentError('Erro ao formatar o json para ActiviteModel')
    };
  }

  ActiviteModel copyWith({
    int? id,
    int? changed,
    String? start,
    String? end,
    String? title,
    String? type,
    ActiviteCategoryModel? activiteCategory,
  }) {
    return ActiviteModel(
      id: id ?? this.id,
      changed: changed ?? this.changed,
      start: start ?? this.start,
      end: end ?? this.end,
      title: title ?? this.title,
      type: type ?? this.type,
      activiteCategory: activiteCategory ?? this.activiteCategory,
    );
  }

  factory ActiviteModel.fromJson(String source) =>
      ActiviteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant ActiviteModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.changed == changed &&
        other.start == start &&
        other.end == end &&
        other.title == title &&
        other.activiteCategory == activiteCategory;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        changed.hashCode ^
        start.hashCode ^
        end.hashCode ^
        title.hashCode ^
        activiteCategory.hashCode;
  }
}
