import 'package:flutter/material.dart';
import 'package:weather_android_app/modules/home/entity/user_location.dart';
import 'package:weather_android_app/modules/home/view/widgets/today_info.dart';
import 'dart:math' as math;

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
          AnimatedWave(controller: _controller, size: size),
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

class AnimatedWave extends StatelessWidget {
  const AnimatedWave({
    super.key,
    required AnimationController controller,
    required this.size,
  }) : _controller = controller;

  final AnimationController _controller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return ClipPath(
          clipper: BackgroundWave(_controller.value),
          child: Container(
            height: size.height * 0.6,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xFF1157BC), Color(0xFF2E9DE2)],
              ),
            ),
          ),
        );
      },
    );
  }
}

class BackgroundWave extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;

  BackgroundWave(this.move);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);

    double xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);

    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
