import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_android_app/components/gradient_scaffold.dart';
import 'package:weather_android_app/modules/register/register_view.dart';
import 'package:weather_android_app/modules/splash/entity/page_item.dart';
import 'package:weather_android_app/modules/splash/view/widgets/auth_button.dart';
import 'package:weather_android_app/modules/splash/view/widgets/skip_button.dart';
import 'package:weather_android_app/routes/app_routes.dart';
import 'package:weather_android_app/utility/app_utility.dart';
import 'package:weather_android_app/utility/text_utility.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late PageItem pageItem;
  late PageController pageController;
  int currentIndex = 0;
  late Size size;

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

  Widget animate(int index, int delay, Widget child) => index == 1
      ? FadeInDown(delay: Duration(milliseconds: delay), child: child)
      : FadeInUp(delay: Duration(milliseconds: delay), child: child);

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
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: _list.length,
                  onPageChanged: (newIndex) {
                    setState(() {
                      currentIndex = newIndex;
                    });
                  },
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return SizedBox(
                      width: size.width,
                      height: size.height,
                      child: Column(
                        children: [
                          // ? Image
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                            width: size.width,
                            height: size.height / 2.5,
                            child: animate(
                              index,
                              100,
                              SvgPicture.asset(_list[index].img,
                                  height: index != 1 ? null : 230),
                            ),
                          ),

                          // ? TITLE
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 25, bottom: 15),
                              child: animate(
                                index,
                                300,
                                Text(
                                  _list[index].title,
                                  textAlign: TextAlign.center,
                                  style: TextUtility.headline1,
                                ),
                              )),

                          // ? SUBTITLE
                          animate(
                            index,
                            500,
                            _list[index].subTitle,
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ? DOT INDICATOR
                    SmoothPageIndicator(
                      controller: pageController,
                      count: _list.length,
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
                        setState(() {
                          currentIndex = newIndex;
                          pageController.animateToPage(newIndex,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                        });
                      },
                    ),
                    SizedBox(
                      height: size.height / 16,
                    ),
                    currentIndex == 2
                        ? Row(
                            children: [
                              Expanded(
                                child: AuthButton(
                                  title: "Registrar",
                                  onPress: () {
                                    Navigator.of(context).push(
                                      AppRouter.createRoute(
                                        const RegisterView(),
                                      ),
                                    );
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
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  final List<PageItem> _list = [
    PageItem(
      img: "assets/images/weather_bro.svg",
      title: "Seja bem-vindo",
      subTitle: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Weather App\n",
              style: TextUtility.headline1,
              children: [
                TextSpan(
                  text: "Sua solução alternativa para ver o clima",
                  style: TextUtility.body1.italic,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    PageItem(
      img: "assets/images/weather_chart.svg",
      title: "Seus dados estão seguros",
      subTitle: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Como seu dado é utilizado?\n",
              style: TextUtility.headline2,
              children: [
                TextSpan(
                  text:
                      "Utilizamos seus dados apenas para armazenar seu histórico",
                  style: TextUtility.body1.italic,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    PageItem(
      img: "assets/images/raining_woman.svg",
      title: "Facil de usar",
      subTitle: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Detalhes do clima\n",
              style: TextUtility.headline1,
              children: [
                TextSpan(
                  text: "Veja dados precisos com apenas um clique",
                  style: TextUtility.body1.italic,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ];
}
