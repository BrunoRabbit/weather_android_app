import 'package:flutter/material.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/home/view/widgets/animated_wave.dart';
import 'package:weather_android_app/modules/home/view/widgets/search_widget.dart';
import 'package:weather_android_app/modules/home/view/widgets/today_info.dart';
import 'package:weather_android_app/routes/app_routes.dart';

class WeatherMainContent extends StatefulWidget {
  const WeatherMainContent({
    super.key,
    required this.size,
    required AnimationController controller,
    required this.homeViewModel,
  }) : _controller = controller;

  final Size size;
  final AnimationController _controller;
  final HomeViewModel homeViewModel;

  @override
  State<WeatherMainContent> createState() => _WeatherMainContentState();
}

class _WeatherMainContentState extends State<WeatherMainContent> {
  double bottomSize = 60.0;
  double rightSize = 30.0;
  double topSize = 0.0;
  Alignment align = Alignment.bottomRight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size.height * 0.6,
      child: Stack(
        children: [
          // ? Wave and today info
          AnimatedWave(
            controller: widget._controller,
            size: widget.size,
          ),
          TodayInfo(widget.homeViewModel.userLocation),

          // ? Search Button
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            alignment: align,
            padding: EdgeInsets.only(
              bottom: bottomSize,
              right: rightSize,
              top: topSize,
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
                    const SearchWidget(),
                  ),
                );
                // ? add IF -> isBtnPressed, connect to API
              },
            ),
          ),
        ],
      ),
    );
  }
}
