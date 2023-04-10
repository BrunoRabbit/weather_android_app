import 'package:flutter/material.dart';
import 'package:weather_android_app/components/gradient_scaffold.dart';
import 'package:weather_android_app/modules/splash/entity/page_item.dart';
import 'package:weather_android_app/modules/splash/view/splash_view_model.dart';
import 'package:weather_android_app/modules/splash/view/widgets/dot_indicator.dart';
import 'package:weather_android_app/modules/splash/view/widgets/page_view_animated.dart';
import 'package:weather_android_app/utils/utility/app_utility.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late PageItem pageItem;
  late Size size;
  late SplashViewModel splashViewModel;

  @override
  void initState() {
    super.initState();
    splashViewModel = SplashViewModel();
  }

  @override
  void dispose() {
    splashViewModel.pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      gradient: const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          AppUtility.kPrimaryColor,
          AppUtility.kSecondaryColor,
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            // ? Page View with animation
            PageViewAnimated(
              size: size,
              splashViewModel: splashViewModel,
            ),

            // ? DOT INDICATOR
            DotIndicator(
              size: size,
              splashViewModel: splashViewModel,
            ),
          ],
        ),
      ),
    );
  }
}
