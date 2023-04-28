import 'package:flutter/material.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/home/view/widgets/animated_wave.dart';
import 'package:weather_android_app/modules/home/view/widgets/today_info.dart';
import 'package:weather_android_app/modules/search/presenter/search_presenter.dart';
import 'package:weather_android_app/modules/search/view/search_view.dart';
import 'package:weather_android_app/modules/search/view/search_view_model.dart';
import 'package:weather_android_app/routes/app_routes.dart';

class WeatherMainContent extends StatelessWidget {
  const WeatherMainContent({
    super.key,
    required this.size,
    required AnimationController controller,
    required this.homeViewModel,
    required this.searchViewModel,
    required this.presenter,
  }) : _controller = controller;

  final Size size;
  final AnimationController _controller;
  final HomeViewModel homeViewModel;
  final SearchViewModel searchViewModel;
  final SearchPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.6,
      child: Stack(
        children: [
          // ? Wave and today info
          AnimatedWave(
            controller: _controller,
            size: size,
          ),
          TodayInfo(homeViewModel.userLocation),

          // ? Search Button
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(
              bottom: 60.0,
              right: 30.0,
            ),
            child: FloatingActionButton(
              heroTag: 'btn1',
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.search,
                color: Colors.black87,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  AppRouter.createRoute(
                    SearchView(searchViewModel, presenter),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
