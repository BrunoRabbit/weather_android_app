import 'package:flutter/material.dart';

import 'package:weather_android_app/modules/home/view/widgets/weather_main_content.dart';
import 'package:weather_android_app/modules/home/view/widgets/weather_week.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Size size;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..stop(canceled: true); // ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          // ? animated container & today weather info
          WeatherMainContent(
            size: size,
            controller: _controller,
          ),

          // ? week weather info
          const WeatherWeek(),
        ],
      ),
    );
  }
}
