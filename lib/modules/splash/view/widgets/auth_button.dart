import 'package:flutter/material.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    this.title = "Entrar",
    required this.onPress,
  }) : super(key: key);

  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      splashColor: Colors.black,
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          height: MediaQuery.of(context).size.height / 13,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.05),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12.0)),
          child: Center(
            child: AppText(
              title,
              style: TextUtility.headline3,
            ),
          ),
        ),
      ),
    );
  }
}
