
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_android_app/modules/home/view/home_view.dart';
import 'package:weather_android_app/modules/splash/presenter/splash_presenter.dart';
import 'package:weather_android_app/modules/splash/view/widgets/auth_button.dart';
import 'package:weather_android_app/modules/splash/view/widgets/page_list.dart';
import 'package:weather_android_app/modules/splash/view/widgets/skip_button.dart';
import 'package:weather_android_app/routes/app_routes.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.pageController,
    required this.size,
    required this.presenter,
  });

  final PageController pageController;
  final Size size;
  final SplashPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmoothPageIndicator(
            controller: pageController,
            count: PageList.init().list.length,
            effect: ExpandingDotsEffect(
              spacing: 6.0,
              radius: 10.0,
              dotWidth: 10.0,
              dotHeight: 10.0,
              expansionFactor: 3.8,
              activeDotColor: Colors.white.withOpacity(.2),
              dotColor: Colors.white.withOpacity(.8),
            ),
            onDotClicked: (newIndex) {
              pageController.animateToPage(newIndex,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            },
          ),
          SizedBox(
            height: size.height / 16,
          ),
          Observer(
            builder: (_) => presenter.currentIndex == 2
                ? Row(
                    children: [
                      Expanded(
                        child: AuthButton(
                          title: "Registrar",
                          onPress: () {
                            Navigator.of(context).push(
                              AppRouter.createRoute(
                                const HomeView(),
                              ),
                            );
                            // Navigator.of(context).push(
                            //   AppRouter.createRoute(
                            //     const RegisterView(),
                            //   ),
                            // );
                          },
                        ),
                      ),
                      Expanded(
                        child: AuthButton(
                          onPress: () {},
                        ),
                      ),
                    ],
                  )
                : SkipButton(
                    size: size,
                    pageController: pageController,
                  ),
          ),
        ],
      ),
    );
  }
}