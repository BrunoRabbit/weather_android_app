import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/home/view/home_view.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/rain/view/widgets/bar_chart.dart';
import 'package:weather_android_app/modules/rain/view/widgets/weather_forecast.dart';
import 'package:weather_android_app/routes/app_routes.dart';
import 'package:weather_android_app/utils/extensions/date_extensions.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';
import 'package:weather_android_app/utils/utility/weekday_utility.dart';

class RainView extends StatelessWidget {
  const RainView(
    this.homeViewModel, {
    Key? key,
  }) : super(key: key);

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();
    final int todayIndex = today.weekday - 3;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(
              AppRouter.createRoute(
                const HomeView(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        title: const AppText(
          'Chuva',
          color: Colors.black,
          size: 22,
          family: 'Regular',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (context) {
            final user = homeViewModel.userLocation!.results!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ? Title, Humidity and Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          'Umidade hoje: (${user.date!.extractDayAndMonth()})',
                          style: TextUtility.headline3.medium.copyWith(
                            color: Colors.grey[700],
                            fontFamily: 'Nunito-Medium',
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/drop_icon_outlined.svg',
                              height: 30,
                            ),
                            const SizedBox(width: 10),
                            AppText(
                              user.humidity!.toStringAsFixed(2),
                              style: TextUtility.title.medium.copyWith(
                                color: Colors.black87,
                                fontFamily: 'Nunito-SemiBold',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(flex: 5),
                    Icon(
                      WeekDayUtility.getIconData(user.description!),
                      size: 40,
                      color: Colors.purple,
                    ),
                    const Spacer(),
                  ],
                ),

                // ? Chart
                Center(
                  child: BarChart(
                    item: user.forecast!,
                    todayIndex: todayIndex,
                  ),
                ),

                // ? Title weather forecast
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Estimativa de clima',
                    style: TextUtility.subtitle1.copyWith(
                        color: Colors.black87, fontFamily: 'Nunito-SemiBold'),
                  ),
                ),

                // ? Weather Forecast
                const WeatherForecast(),
              ],
            );
          },
        ),
      ),
    );
  }
}
