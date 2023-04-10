import 'package:flutter/material.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/splash/view/splash_view_model.dart';
import 'package:weather_android_app/utils/utility/app_utility.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    Key? key,
    required this.size,
    required this.splashViewModel,
  }) : super(key: key);

  final Size size;
  final SplashViewModel splashViewModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      splashColor: AppUtility.kSecondaryColor,
      onTap: () => splashViewModel.skipToPage(),
      child: Container(
        width: size.width / 1.5,
        height: size.height / 13,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppUtility.kSecondaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: AppText(
            "Pular",
            style: TextUtility.headline3,
          ),
        ),
      ),
    );
  }
}
