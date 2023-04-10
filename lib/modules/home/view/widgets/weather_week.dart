import 'package:flutter/material.dart';
import 'package:weather_android_app/components/app_text.dart';

import 'package:weather_android_app/modules/home/entity/user_location.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';
import 'package:weather_android_app/utils/utility/weekday_utility.dart';

enum WeatherDescription {
  parcialmenteNublado,
  chuva,
  chuvasEsparsas,
  tempoNublado,
  tempoLimpo,
}

class WeatherWeek extends StatelessWidget {
  const WeatherWeek({
    Key? key,
    this.userLocation,
  }) : super(key: key);

  final UserLocation? userLocation;

  @override
  Widget build(BuildContext context) {
    final weekDetails = userLocation?.results?.forecast;

    final style = TextUtility.headline3.medium.copyWith(
      color: const Color(0xFF969696),
      fontFamily: 'Nunito-Bold',
      fontSize: 20,
    );

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0, bottom: 12),
        itemCount: weekDetails!.length - 3,
        itemExtent: 65,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Material(
              elevation: 8,
              color: Colors.grey[100],
              borderRadius: const BorderRadius.all(
                Radius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    AppText(
                      WeekDayUtility.getWeekDay(
                          weekDetails[index + 1].weekday!),
                      style: style,
                    ),
                    const Spacer(),
                    AppText(
                      "${weekDetails[index + 1].max}°",
                      style: style,
                    ),
                    const SizedBox(width: 14),
                    Icon(
                      WeekDayUtility.getIconData(
                          weekDetails[index + 1].description!),
                      color: const Color(0xFF969696),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}