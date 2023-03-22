import 'package:flutter/material.dart';
import 'package:weather_android_app/utility/app_utility.dart';
import 'package:weather_android_app/utility/text_utility.dart';

class AppTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String labelText;
  final TextEditingController controller;

  const AppTextField({
    Key? key,
    this.validator,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  final Color colorTxt = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextUtility.body2.bold.copyWith(color: colorTxt),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppUtility.formBackground,
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: 'Digite aqui...',
              hintStyle: TextUtility.body2.copyWith(
                color: colorTxt.withOpacity(.4),
              ),
              errorStyle: TextUtility.error1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
