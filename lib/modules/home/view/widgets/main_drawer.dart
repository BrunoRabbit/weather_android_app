import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/rain/view/rain_view.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view_model.dart';
import 'package:weather_android_app/routes/app_routes.dart';
import 'package:weather_android_app/utils/utility/app_utility.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
    required this.homeViewModel,
    required this.viewModel,
  }) : super(key: key);

  final HomeViewModel homeViewModel;
  final VisibilityViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final List<DrawerItem> list = [
      DrawerItem(
        title: 'Visibilidade',
        icon: 'assets/images/cloud-fog.svg',
        onPress: () {
          Navigator.of(context).push(
            AppRouter.createRoute(
              VisibilityView(homeViewModel, viewModel),
            ),
          );
        },
      ),
      DrawerItem(
        title: 'Umidade',
        icon: 'assets/images/drop_icon.svg',
        onPress: () {
          Navigator.of(context).push(
            AppRouter.createRoute(
              RainView(homeViewModel, viewModel),
            ),
          );
        },
      ),
    ];
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
          for (var item in list)
            _ItemsDrawer(
              homeViewModel,
              item.title,
              item.icon,
              onPress: item.onPress,
            ),
        ],
      ),
    );
  }
}

// ? VISIBILITY - HUMIDITY
class _ItemsDrawer extends StatelessWidget {
  const _ItemsDrawer(
    this.homeViewModel,
    this.title,
    this.icon, {
    required this.onPress,
    Key? key,
  }) : super(key: key);

  final HomeViewModel homeViewModel;
  final String title;
  final String icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: 4.0,
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: AppText(
          title,
          size: TextUtility.headline3.fontSize,
          family: 'Bold',
          color: Colors.black,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 2.0),
          child: SvgPicture.asset(
            icon,
            height: 30,
            color: const Color(0xff323232),
          ),
        ),
        onTap: onPress,
      ),
    );
  }
}

class DrawerItem {
  DrawerItem({
    required this.title,
    required this.icon,
    required this.onPress,
  });

  final String title;
  final String icon;
  final VoidCallback onPress;
}
