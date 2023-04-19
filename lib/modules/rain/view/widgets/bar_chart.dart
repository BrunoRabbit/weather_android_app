import 'package:flutter/material.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/home/entity/user_location.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class BarChart extends StatelessWidget {
  const BarChart({
    super.key,
    required this.item,
    required this.todayIndex,
  });

  final List<Forecast> item;
  final int todayIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ? Chart Title
            Center(
              child: AppText(
                'Probabilidade de chuva',
                style: TextUtility.body1.copyWith(
                  color: Colors.grey[700],
                  fontFamily: 'Regular',
                ),
              ),
            ),

            // ? Chart
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for (int i = 0; i < 7; i++)
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // ? Rain probability
                            AppText(
                              '${((item[i].rainProbability!)).toStringAsFixed(1)}%',
                              family: 'SemiBold',
                              color: i == todayIndex
                                  ? Colors.black
                                  : Colors.grey[700],
                            ),

                            // ? Bar Chart
                            Container(
                              width: 30,
                              height: item[i].rainProbability! * 12.0,
                              decoration: BoxDecoration(
                                color: i == todayIndex
                                    ? Colors.purple
                                    : const Color(0xffB38AFF),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(2, 0),
                                    blurRadius: 2,
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),

                            Column(
                              children: [
                                // ? Week day
                                AppText(
                                  item[i].weekday!,
                                  style: TextUtility.body1.bold.copyWith(
                                    color: i == todayIndex
                                        ? Colors.black
                                        : Colors.grey[700],
                                  ),
                                ),

                                // ?
                                AppText(
                                  item[i].date!,
                                  style: TextUtility.body2.bold.copyWith(
                                    color: i == todayIndex
                                        ? Colors.black
                                        : Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
