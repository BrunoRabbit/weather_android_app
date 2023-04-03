import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_android_app/modules/home/presenter/home_presenter.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view.dart';
import 'package:weather_android_app/routes/app_routes.dart';
import 'package:weather_android_app/utility/app_utility.dart';
import 'package:weather_android_app/utility/text_utility.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final HomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.14,
            width: double.infinity,
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(20),
            color: AppUtility.kSecondaryColor,
            child: Text(
              'Weather App',
              style: TextUtility.headline2.copyWith(
                fontFamily: 'Nunito-Bold',
                fontSize: 30,
              ),
            ),
          ),
          _ItemsDrawer(presenter: presenter),
        ],
      ),
    );
  }
}

// ? VISIBILITY - HUMIDITY
class _ItemsDrawer extends StatelessWidget {
  const _ItemsDrawer({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  final HomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: Text(
          'Visibilidade',
          style: TextUtility.headline3.copyWith(
            color: Colors.black,
            fontFamily: 'Nunito-Bold',
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: SvgPicture.asset(
            'assets/images/cloud-fog.svg',
            height: 30,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            AppRouter.createRoute(
              VisibilityView(presenter),
            ),
           );
        },
      ),
    );
  }
}
