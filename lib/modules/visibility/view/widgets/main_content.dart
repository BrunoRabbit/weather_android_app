import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/home/view/home_view.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/visibility/view/widgets/date_list.dart';
import 'package:weather_android_app/modules/visibility/view/widgets/semi_circle_widget.dart';
import 'package:weather_android_app/routes/app_routes.dart';
import 'package:weather_android_app/utils/extensions/date_extensions.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
    required this.homeViewModel,
  }) : super(key: key);

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 0, top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ? AppBar
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () {
                    Navigator.of(context).pop(
                      AppRouter.createRoute(
                        const HomeView(),
                      ),
                    );
                  },
                ),
              ],
            ),

            // ? Date
            Observer(
              builder: (context) {
                return homeViewModel.userLocation != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8),
                        child: AppText(
                          homeViewModel.userLocation!.results!.date!.dateFormat(),
                          style: TextUtility.headline3.copyWith(
                            color: Colors.grey,
                            fontFamily: 'Nunito-SemiBold',
                          ),
                        ),
                      )
                    : Container();
              },
            ),

            // ? Title
            Padding(
              padding: const EdgeInsets.only(
                bottom: 24.0,
                top: 10,
                left: 16.0,
                right: 16.0,
              ),
              child: Column(
                children: [
                  AppText(
                    'Visibilidade',
                    style: TextUtility.headline2.copyWith(
                      color: Colors.black87,
                      fontFamily: 'Nunito-Bold',
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),

            // ? SemiCirle custom paint
            SemiCircleWidget(homeViewModel),

            const SizedBox(
              height: 50,
            ),

            // ? Circle and date now
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 16),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 25,
                        width: 25,
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 16,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    homeViewModel.userLocation!.results!.date!.monthFormat(),
                    style: TextUtility.body1.copyWith(
                      color: Colors.black,
                      fontFamily: 'Nunito-Medium',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // ? Date list
            DateList(homeViewModel),

            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: AppText(
                'Histórico',
                style: TextUtility.body1.copyWith(
                  color: Colors.black,
                  fontFamily: 'Nunito-Medium',
                ),
              ),
            ),

            // ? Historic
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
