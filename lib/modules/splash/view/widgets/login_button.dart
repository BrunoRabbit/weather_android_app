import 'package:flutter/material.dart';
import 'package:weather_android_app/modules/home/view/home_view.dart';
import 'package:weather_android_app/routes/app_routes.dart';
import 'package:weather_android_app/utility/text_utility.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      splashColor: Colors.black,
      onTap: () {
        Navigator.of(context).push(AppRouter.createRoute(const MyHomePage()));
      },
      child: Container(
        width: size.width / 1.5,
        height: size.height / 13,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(.05),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12.0)),
        child: Center(
          child: Text(
            "Entrar",
            style: TextUtility.headline3,
          ),
        ),
      ),
    );
  }
}
