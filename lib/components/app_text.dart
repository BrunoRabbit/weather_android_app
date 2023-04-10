import 'package:flutter/material.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.family,
    this.size,
    this.color,
    this.fontWeight,
    this.textAlign,
    this.style,
  });

  final String text;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  /// If style is set it will override the individual properties, otherwise the individual properties will be used to construct the style.
  final TextStyle? style;

  /// Choose one: Bold, ExtraBold, ExtraLight, Light, Medium, Regular, SemiBold
  /// Default: Regular
  final String? family;

  @override
  Widget build(BuildContext context) {
    final textStyle = style ??
        TextUtility.body2.copyWith(
          fontFamily: 'Nunito-${family ?? 'Regular'}',
          fontSize: size,
          color: color ?? Colors.white,
          fontWeight: fontWeight,
        );

    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}
