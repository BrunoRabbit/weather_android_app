import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/visibility/view/widgets/main_content.dart';

class VisibilityView extends StatefulWidget {
  const VisibilityView(
    this.homeViewModel, {
    Key? key,
  }) : super(key: key);

  final HomeViewModel homeViewModel;

  @override
  State<VisibilityView> createState() => _VisibilityViewState();
}

class _VisibilityViewState extends State<VisibilityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: animate(
        100,
        MainContent(
          homeViewModel: widget.homeViewModel,
        ),
      ),
    );
  }

  Widget animate(int delay, Widget child) {
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }
}
