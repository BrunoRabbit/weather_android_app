import 'package:flutter/material.dart';
import 'package:weather_android_app/utility/text_utility.dart';

class CurrentTimeIndicator extends StatelessWidget {
  const CurrentTimeIndicator({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextUtility.headline3.copyWith(
              fontFamily: 'Nunito-Medium',
            ),
          ),
        ),
        Icon(
          icon,
          size: 20,
          color: Colors.white,
        )
      ],
    );
  }
}
