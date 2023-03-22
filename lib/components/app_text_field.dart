import 'package:flutter/material.dart';
import 'package:weather_android_app/utility/app_utility.dart';
import 'package:weather_android_app/utility/text_utility.dart';

class AppTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String labelText;

  const AppTextField({
    Key? key,
    this.validator,
    required this.labelText,
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
          Container(
            decoration: BoxDecoration(
              color: AppUtility.formBackground,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextFormField(
              validator: validator,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: 'Digite aqui...',
                hintStyle: TextUtility.body2.copyWith(
                  color: colorTxt.withOpacity(.4),
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
