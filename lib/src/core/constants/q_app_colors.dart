import 'package:flutter/material.dart';
import 'package:todolist/src/core/constants/q_colors.dart';

import '../../utils/colors_utils.dart';

class QAppColors {
  static final MaterialColor primaryColors =
      ColorUtility.generateMaterialColor(primarySwatch);

  static const Color primarySwatch = QColors.primary;
  static const Color primaryLight = Color.fromARGB(255, 255, 255, 255);

  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}
