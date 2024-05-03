// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chuva/app/core/extensions/css_from_color.extension.dart';
import 'package:flutter/material.dart';

class ActiviteModel {
  final int id;
  final int changed;
  final String start;
  final String end;
  final String title;
  final Color color;
  final Color backGroundColor;
  ActiviteModel({
    required this.id,
    required this.changed,
    required this.start,
    required this.end,
    required this.title,
    required this.color,
    required this.backGroundColor,
  });

  factory ActiviteModel.fromMap(Map map) {
    return switch (map) {
      {
        "id": final int id,
        "changed": final int changed,
        "start": final String start,
        "end": final String end,
        "title": final String title,
        "color": final String color,
        "background-color": final String backGroundColor,
      } =>
        ActiviteModel(
            id: id,
            changed: changed,
            start: start,
            end: end,
            title: title,
            color: color.cssFromColor(),
            backGroundColor: backGroundColor.cssFromColor()),
      _ => throw ArgumentError('Erro ao formatar o json para ActiviteModel')
    };
  }

  ActiviteModel copyWith({
    int? id,
    int? changed,
    String? start,
    String? end,
    String? title,
    Color? color,
    Color? backGroundColor,
  }) {
    return ActiviteModel(
      id: id ?? this.id,
      changed: changed ?? this.changed,
      start: start ?? this.start,
      end: end ?? this.end,
      title: title ?? this.title,
      color: color ?? this.color,
      backGroundColor: backGroundColor ?? this.backGroundColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'changed': changed,
      'start': start,
      'end': end,
      'title': title,
      'color': color.value,
      'backGroundColor': backGroundColor.value,
    };
  }

  String toJson() => json.encode(toMap());

  factory ActiviteModel.fromJson(String source) =>
      ActiviteModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ActiviteModel(id: $id, changed: $changed, start: $start, end: $end, title: $title, color: $color, backGroundColor: $backGroundColor)';
  }

  @override
  bool operator ==(covariant ActiviteModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.changed == changed &&
        other.start == start &&
        other.end == end &&
        other.title == title &&
        other.color == color &&
        other.backGroundColor == backGroundColor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        changed.hashCode ^
        start.hashCode ^
        end.hashCode ^
        title.hashCode ^
        color.hashCode ^
        backGroundColor.hashCode;
  }
}
