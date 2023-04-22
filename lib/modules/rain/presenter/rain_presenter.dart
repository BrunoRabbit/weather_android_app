import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_android_app/modules/home/entity/user_location.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/rain/view/rain_view_model.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view_model.dart';

class RainPresenter {
  RainPresenter({
    required this.homeViewModel,
    required this.viewModel,
    required this.rainViewModel,
  });

  HomeViewModel homeViewModel;
  VisibilityViewModel viewModel;
  RainViewModel rainViewModel;

  String verifyDateTime(Results user) {
    final weekday = user.forecast![viewModel.currentIndex].weekday!;
    final nonWorkingDays = ['Sáb', 'Dom'];

    if (viewModel.currentIndex != 0) {
      if (nonWorkingDays.contains(weekday)) {
        return 'no $weekday';
      } else {
        return 'na $weekday';
      }
    } else {
      return 'hoje';
    }
  }

  Future<List<int>> accessHumidity(
    int humidity,
    SharedPreferences prefs,
  ) async {
    if (prefs.containsKey('humidityList')) {
      rainViewModel.humidityList =
          prefs.getStringList('humidityList')!.map(int.parse).toList();
    }

    if (rainViewModel.humidityList!.length < 7) {
      final Random random = Random();
      rainViewModel.humidityList = [humidity];

      for (var i = rainViewModel.humidityList!.length; i < 7; i++) {
        rainViewModel.humidityList!.add(random.nextInt(101));
      }

      await prefs.setStringList(
        'humidityList',
        rainViewModel.humidityList!.map((e) => e.toString()).toList(),
      );
    }

    return rainViewModel.humidityList!;
  }
}
