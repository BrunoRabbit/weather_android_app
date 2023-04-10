import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/splash/view/splash_view_model.dart';
import 'package:weather_android_app/modules/splash/view/widgets/page_list.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class PageViewAnimated extends StatelessWidget {
  PageViewAnimated({
    Key? key,
    required this.size,
    required this.splashViewModel,
  }) : super(key: key);

  final Size size;
  final SplashViewModel splashViewModel;

  final _list = PageList.init().list;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: PageView.builder(
        controller: splashViewModel.pageController,
        itemCount: _list.length,
        onPageChanged: (newIndex) => splashViewModel.onPageChanged(newIndex),
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
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: animate(
                      index,
                      300,
                      AppText(
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
    );
  }

  // * Animate Splash View
  Widget animate(int index, int delay, Widget child) => index == 1
      ? FadeInDown(delay: Duration(milliseconds: delay), child: child)
      : FadeInUp(delay: Duration(milliseconds: delay), child: child);
}
