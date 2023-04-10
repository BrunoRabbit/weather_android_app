import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_android_app/modules/home/entity/user_location.dart';
import 'package:weather_android_app/modules/home/view/widgets/current_time_indicator.dart';

import 'package:weather_android_app/utils/utility/text_utility.dart';

class TodayInfo extends StatelessWidget {
  const TodayInfo(this.userLocation, {super.key});

  final UserLocation? userLocation;

  @override
  Widget build(BuildContext context) {
    final Forecast? forecastInfo = userLocation?.results?.forecast?[0];
    final Results? weatherInfo = userLocation?.results;

    return Padding(
      padding: const EdgeInsets.only(bottom: 60, right: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // * Centered Temp
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${weatherInfo?.temp.toString() ?? '18'}°",
                style: TextUtility.headline1.medium
                    .copyWith(fontFamily: 'Nunito-Medium'),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // * Max, description and Min temp details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CurrentTimeIndicator(
                title: '${forecastInfo?.max.toString() ?? '26'}°',
                icon: FontAwesomeIcons.caretUp,
              ),
              Expanded(
                child: Text(
                  forecastInfo?.description ?? 'Desconhecido',
                  style: TextUtility.headline3.medium.copyWith(
                    fontFamily: 'Nunito-Medium',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              CurrentTimeIndicator(
                title: '${forecastInfo?.min.toString() ?? '15'}°',
                icon: FontAwesomeIcons.caretDown,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
