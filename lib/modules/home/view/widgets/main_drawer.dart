import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view.dart';
import 'package:weather_android_app/routes/app_routes.dart';
import 'package:weather_android_app/utils/utility/app_utility.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
    required this.homeViewModel,
  }) : super(key: key);

  final HomeViewModel homeViewModel;

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
            child: AppText(
              'Weather App',
              size: TextUtility.headline2.copyWith(fontSize: 30).fontSize,
              family: 'Bold',
            ),
          ),
          _ItemsDrawer(homeViewModel),
        ],
      ),
    );
  }
}

// ? VISIBILITY - HUMIDITY
class _ItemsDrawer extends StatelessWidget {
  const _ItemsDrawer(
    this.homeViewModel, {
    Key? key,
  }) : super(key: key);

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: AppText(
          'Visibilidade',
          size: TextUtility.headline3.fontSize,
          family: 'Bold',
          color: Colors.black,
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
              VisibilityView(homeViewModel),
            ),
          );
        },
      ),
    );
  }
}
