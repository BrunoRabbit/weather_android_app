import 'package:flutter/material.dart';
import 'package:weather_android_app/components/gradient_scaffold.dart';
import 'package:weather_android_app/modules/splash/entity/page_item.dart';
import 'package:weather_android_app/modules/splash/presenter/splash_presenter.dart';
import 'package:weather_android_app/modules/splash/view/widgets/dot_indicator.dart';
import 'package:weather_android_app/modules/splash/view/widgets/page_view_animated.dart';
import 'package:weather_android_app/utility/app_utility.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late PageItem pageItem;
  late PageController pageController;
  late Size size;

  SplashPresenter presenter = SplashPresenter();

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            AppUtility.primaryColor,
            AppUtility.secondaryColor,
          ],
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              // ? Page View with animation
              PageViewAnimated(
                pageController: pageController,
                size: size,
                presenter: presenter,
              ),

              // ? DOT INDICATOR
              DotIndicator(
                pageController: pageController,
                size: size,
                presenter: presenter,
              ),
            ],
          ),
        ));
  }
}

