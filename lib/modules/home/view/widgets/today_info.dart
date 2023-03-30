import 'package:flutter/material.dart';
import 'package:weather_android_app/modules/home/entity/user_location.dart';
import 'package:weather_android_app/modules/home/view/widgets/current_time_indicator.dart';

import 'package:weather_android_app/utility/text_utility.dart';

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
          Row(
            children: [
              const Spacer(),
              Text(
                "${weatherInfo?.temp.toString() ?? '18'}°",
                style: TextUtility.title.medium,
              ),
              const Spacer(flex: 2),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CurrentTimeIndicator(
                title: '${forecastInfo?.max.toString() ?? '26'}°',
                icon: Icons.arrow_drop_up_sharp,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    forecastInfo?.description ?? 'Desconhecido',
                    style: TextUtility.headline2.medium,
                  ),
                ),
              ),
              CurrentTimeIndicator(
                title: '${forecastInfo?.min.toString() ?? '15'}°',
                icon: Icons.arrow_drop_down_sharp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
