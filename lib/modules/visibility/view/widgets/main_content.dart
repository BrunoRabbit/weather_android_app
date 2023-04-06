import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_android_app/modules/home/presenter/home_presenter.dart';
import 'package:weather_android_app/modules/home/view/home_view.dart';
import 'package:weather_android_app/modules/visibility/view/widgets/semi_circle_widget.dart';
import 'package:weather_android_app/routes/app_routes.dart';
import 'package:weather_android_app/utility/date_extensions.dart';
import 'package:weather_android_app/utility/text_utility.dart';

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final HomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                return presenter.userLocation != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8),
                        child: Text(
                          presenter.userLocation!.results!.date!.dateFormat(),
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
                  Text(
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
            SemiCircleWidget(presenter),

            const SizedBox(
              height: 50,
            ),

            // ? circle and date now
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
                    presenter.userLocation!.results!.date!.monthFormat(),
                    style: TextUtility.body1.copyWith(
                        color: Colors.black, fontFamily: 'Nunito-Medium'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
