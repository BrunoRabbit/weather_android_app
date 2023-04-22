import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/home/view/home_view.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/rain/presenter/rain_presenter.dart';
import 'package:weather_android_app/modules/rain/view/rain_view_model.dart';
import 'package:weather_android_app/modules/rain/view/widgets/bar_chart.dart';
import 'package:weather_android_app/modules/rain/view/widgets/weather_forecast.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view_model.dart';
import 'package:weather_android_app/routes/app_routes.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';
import 'package:weather_android_app/utils/utility/weekday_utility.dart';

class RainView extends StatefulWidget {
  const RainView(
    this.homeViewModel,
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  final HomeViewModel homeViewModel;
  final VisibilityViewModel viewModel;

  @override
  State<RainView> createState() => _RainViewState();
}

class _RainViewState extends State<RainView> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late final RainPresenter rainPresenter;
  final RainViewModel rainViewModel = RainViewModel();

  @override
  void initState() {
    super.initState();
    rainPresenter = RainPresenter(
      homeViewModel: widget.homeViewModel,
      viewModel: widget.viewModel,
      rainViewModel: rainViewModel,
    );
  }

  @override
  Widget build(BuildContext context) {
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
            final user = widget.homeViewModel.userLocation!.results!;
            final date = user.forecast![widget.viewModel.currentIndex].date;

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
                          'Umidade ${rainPresenter.verifyDateTime(user)}: ($date)',
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
                            FutureBuilder<List<int>>(
                              future: initHumidityList(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  final int humidityList =
                                      rainViewModel.humidityList?[
                                              widget.viewModel.currentIndex] ??
                                          0;
                                  return AppText(
                                    humidityList.toStringAsFixed(2),
                                    style: TextUtility.title.medium.copyWith(
                                      color: Colors.black87,
                                      fontFamily: 'Nunito-SemiBold',
                                    ),
                                  );
                                }
                                return Container();
                              },
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
                    viewModel: widget.viewModel,
                  ),
                ),

                // ? Title weather forecast
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    'Estimativa de clima',
                    style: TextUtility.subtitle1.copyWith(
                      color: Colors.black87,
                      fontFamily: 'Nunito-SemiBold',
                    ),
                  ),
                ),

                // ? Weather Forecast
                WeatherForecast(
                  item: user,
                  viewModel: widget.viewModel,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<List<int>> initHumidityList() async {
    SharedPreferences sharedPrefs = await _prefs;

    rainViewModel.humidityList = await rainPresenter.accessHumidity(
      widget.homeViewModel.userLocation!.results!.humidity!,
      sharedPrefs,
    );

    return rainViewModel.humidityList!;
  }
}
