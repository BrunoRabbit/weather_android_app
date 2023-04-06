// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:weather_android_app/utility/text_utility.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    Key? key,
    this.family,
    this.size,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  final String text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;

  /// Choose one: Bold, ExtraBold, ExtraLight, Light, Medium, Regular, SemiBold
  /// Default: Regular
  final String? family;
  

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextUtility.body2.copyWith(
        fontFamily: 'Nunito-${family ?? 'Regular'}',
        fontSize: size,
        color: color ?? Colors.white,
        fontWeight: fontWeight
      ),
    );
  }
}
