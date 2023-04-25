import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/home/entity/user_location.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view_model.dart';
import 'package:weather_android_app/utils/utility/app_utility.dart';
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
    required this.viewModel,
  }) : super(key: key);

  final UserLocation? userLocation;
  final VisibilityViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final weekDetails = userLocation?.results?.forecast;

    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0, bottom: 12),
        itemCount: 7,
        itemExtent: 65,
        itemBuilder: (context, index) {
          return Observer(
            builder: (context) {
              final style = TextUtility.headline3.medium.copyWith(
                color: index == viewModel.currentIndex
                    ? Colors.white
                    : const Color(0xFF969696),
                fontFamily: 'Nunito-Bold',
                fontSize: 20,
              );

              final weekday = WeekDayUtility.getWeekDay(
                weekDetails![index].weekday!,
              );

              return GestureDetector(
                onTap: () {
                  viewModel.changeIndex(index);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 10,
                  ),
                  child: Material(
                    elevation: 8,
                    color: index == viewModel.currentIndex
                        ? AppUtility.kPrimaryColor.withOpacity(.9)
                        : Colors.grey[100],
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
                            index == 0 ? "$weekday (Hoje)" : weekday,
                            style: style,
                          ),
                          const Spacer(),
                          AppText(
                            "${index != 0 ? weekDetails[index].max! : weekDetails[0].max!}°",
                            style: style,
                          ),
                          const SizedBox(width: 14),
                          Icon(
                            WeekDayUtility.getIconData(
                              index != 0
                                  ? weekDetails[index].description!
                                  : weekDetails[0].description!,
                            ),
                            color: index == viewModel.currentIndex
                                ? Colors.white
                                : const Color(0xFF969696),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
