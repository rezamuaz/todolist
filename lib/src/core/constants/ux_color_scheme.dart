import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors(
      {required this.greenSuccess,
      required this.blueInfo,
      required this.yellowWarning,
      required this.redDanger,
      required this.whiteColor,
      required this.semiBlackColor});

  final Color? greenSuccess;
  final Color? blueInfo;
  final Color? yellowWarning;
  final Color? redDanger;
  final Color? whiteColor;
  final Color? semiBlackColor;

  @override
  CustomColors copyWith(
      {Color? greenSuccess,
      Color? blueInfo,
      Color? yellowWarning,
      Color? redDanger,
      Color? whiteColor,
      Color? semiBlackColor}) {
    return CustomColors(
        greenSuccess: greenSuccess ?? this.greenSuccess,
        blueInfo: blueInfo ?? this.blueInfo,
        yellowWarning: yellowWarning ?? this.yellowWarning,
        redDanger: redDanger ?? this.redDanger,
        whiteColor: whiteColor ?? this.whiteColor,
        semiBlackColor: semiBlackColor ?? this.semiBlackColor);
  }

  // Controls how the properties change on theme changes
  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
        greenSuccess: Color.lerp(greenSuccess, other.greenSuccess, t),
        blueInfo: Color.lerp(blueInfo, other.blueInfo, t),
        yellowWarning: Color.lerp(yellowWarning, other.yellowWarning, t),
        redDanger: Color.lerp(redDanger, other.redDanger, t),
        whiteColor: Color.lerp(whiteColor, other.whiteColor, t),
        semiBlackColor: Color.lerp(semiBlackColor, other.semiBlackColor, t));
  }

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'CustomColors('
      'greenSuccess: $greenSuccess, blueInfo: $blueInfo, yellowWarning: $blueInfo, redDanger: $redDanger, whiteColor: $whiteColor, semiBlackColor: $semiBlackColor'
      ')';

  // the light theme
  static const light = CustomColors(
      greenSuccess: Color(0xff38B000),
      blueInfo: Color(0xff17a2b8),
      yellowWarning: Color(0xffFDCE22),
      redDanger: Color(0xffED1B23),
      whiteColor: Color(0xFFFFFFFF),
      semiBlackColor: Color(0xff383838));

  // the dark theme
  static const dark = CustomColors(
      greenSuccess: Color(0xff00bc8c),
      blueInfo: Color(0xff17a2b8),
      yellowWarning: Color(0xfff39c12),
      redDanger: Color(0xffe74c3c),
      whiteColor: Color(0xFFFFFFFF),
      semiBlackColor: Color(0xff383838));
}
