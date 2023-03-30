import 'package:flutter/material.dart';
import 'package:weather_android_app/modules/home/entity/user_location.dart';
import 'package:weather_android_app/modules/home/view/widgets/animated_wave.dart';
import 'package:weather_android_app/modules/home/view/widgets/today_info.dart';

class WeatherMainContent extends StatelessWidget {
  const WeatherMainContent({
    super.key,
    required this.size,
    required AnimationController controller,
    required this.userLocation,
  }) : _controller = controller;

  final Size size;
  final AnimationController _controller;
  final UserLocation? userLocation;

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
          TodayInfo(userLocation),

          // ? Search Button
          Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(bottom: 60, right: 30),
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.search,
                color: Colors.black87,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
