import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/utils/utility/app_utility.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class AppTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String labelText;
  final TextEditingController controller;
  final List<TextInputFormatter>? textInputFormatter;
  final bool obscureText;
  final void Function(String)? onChanged;

  const AppTextField({
    Key? key,
    this.validator,
    required this.labelText,
    required this.controller,
    this.textInputFormatter,
    this.obscureText = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            labelText,
            family: 'SemiBold',
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            validator: validator,
            controller: controller,
            inputFormatters: textInputFormatter,
            obscureText: obscureText,
            onChanged: onChanged,
            cursorColor: AppUtility.kSecondaryBackground,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppUtility.kFormBackground,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: 'Digite aqui...',
              hintStyle: TextUtility.body2.copyWith(
                color: Colors.white.withOpacity(.4),
                fontFamily: 'Nunito-Medium',
              ),
              errorStyle: TextUtility.error1.copyWith(
                fontFamily: 'Nunito-Regular',
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: AppUtility.kErrorColor.withOpacity(.6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
