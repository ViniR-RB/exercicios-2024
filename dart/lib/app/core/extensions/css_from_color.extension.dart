import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

extension CssFromColor on String {
  Color cssFromColor() {
    return fromCssColor(this);
  }
}
