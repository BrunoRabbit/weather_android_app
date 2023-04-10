import 'package:flutter/material.dart';

extension TextExtensions on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}

class TextUtility {
  static const TextStyle _base = TextStyle(
    fontSize: 14,
    color: Colors.white,
  );
  static TextStyle title = _base.copyWith(
    fontSize: 46,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headline1 = _base.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headline2 = _base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle headline3 = _base.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static TextStyle body1 = _base.copyWith(
    fontSize: 16,
  );

  static TextStyle body2 = _base.copyWith(
    fontSize: 14,
  );

  static TextStyle subtitle1 = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  static TextStyle subtitle2 = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.grey,
  );

  static TextStyle error1 = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: const Color(0xffe03c4c),
  );
}
