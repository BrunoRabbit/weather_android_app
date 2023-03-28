import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_android_app/modules/splash/presenter/splash_presenter.dart';
import 'package:weather_android_app/modules/splash/view/widgets/page_list.dart';
import 'package:weather_android_app/utility/text_utility.dart';

class PageViewAnimated extends StatelessWidget {
  PageViewAnimated({
    super.key,
    required this.pageController,
    required this.size,
    required this.presenter,
  });

  final PageController pageController;
  final Size size;
  final SplashPresenter presenter;

  final _list = PageList.init().list;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: PageView.builder(
        controller: pageController,
        itemCount: _list.length,
        onPageChanged: (newIndex) {
          presenter.changeIndex(newIndex);
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
                    padding: const EdgeInsets.only(top: 25, bottom: 15),
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
    );
  }

  Widget animate(int index, int delay, Widget child) => index == 1
      ? FadeInDown(delay: Duration(milliseconds: delay), child: child)
      : FadeInUp(delay: Duration(milliseconds: delay), child: child);
}
