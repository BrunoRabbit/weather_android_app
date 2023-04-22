import 'package:flutter/material.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view_model.dart';
import 'package:weather_android_app/modules/visibility/view/widgets/fade_in_animate.dart';
import 'package:weather_android_app/modules/visibility/view/widgets/main_content.dart';

class VisibilityView extends StatelessWidget {
  const VisibilityView(
    this.homeViewModel,
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  final HomeViewModel homeViewModel;
  final VisibilityViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInAnimate(
        100,
        FadeTypes.fadeInUp,
        child: MainContent(homeViewModel: homeViewModel, viewModel: viewModel),
      ),
    );
  }
}
