import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleTextTitle = TextUtility.body1.copyWith(
      fontFamily: 'Nunito-Medium',
    );
    final styleTextInformation = TextUtility.body1.copyWith(
      fontFamily: 'Nunito-Bold',
      fontSize: 18,
    );

    return Expanded(
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        color: Colors.purple,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/wind_speed.svg',
                    height: 80,
                    color: Colors.white,
                  ),
                  AppText(
                    'Vel. do vento',
                    style: styleTextTitle,
                  ),
                  AppText(
                    '12.02 km/h',
                    style: styleTextInformation,
                  ),
                ],
              ),
            ),
            const VerticalDivider(
              color: Colors.grey,
              thickness: 1,
              width: 15,
              indent: 40,
              endIndent: 40,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    'Condição atual:',
                    style: styleTextTitle,
                  ),
                  AppText(
                    'Tempo Limpo',
                    style: styleTextInformation,
                  ),
                  const SizedBox(height: 10),
                  AppText(
                    'Ultima atualização:',
                    style: styleTextTitle,
                  ),
                  AppText(
                    '19:55',
                    style: styleTextInformation,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
