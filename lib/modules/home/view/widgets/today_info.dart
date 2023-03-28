import 'package:flutter/material.dart';
import 'package:weather_android_app/modules/home/view/widgets/current_time_indicator.dart';

import 'package:weather_android_app/utility/text_utility.dart';

class TodayInfo extends StatelessWidget {
  const TodayInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60, right: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              '18°',
              style: TextUtility.headline1.medium,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CurrentTimeIndicator(
                title: '26°',
                icon: Icons.arrow_drop_up_sharp,
              ),
              Text(
                'Cloudy',
                style: TextUtility.headline1.medium,
              ),
              const CurrentTimeIndicator(
                title: '15°',
                icon: Icons.arrow_drop_down_sharp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
