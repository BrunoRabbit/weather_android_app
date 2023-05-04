import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view_model.dart';
import 'package:weather_android_app/utils/extensions/date_extensions.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class AppbarToTitle extends StatelessWidget {
  const AppbarToTitle(
    this.viewModel,
    this.homeViewModel, {
    Key? key,
  }) : super(key: key);

  final HomeViewModel homeViewModel;
  final VisibilityViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ? AppBar
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),

        // ? Date Time now
        Observer(
          builder: (context) {
            final dayMonth = homeViewModel
                .userLocation!.results!.forecast![viewModel.currentIndex].date!;
            final year =
                homeViewModel.userLocation!.results!.date!.substring(6, 10);
            final dateTime = '$dayMonth/$year';

            return homeViewModel.userLocation != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 8),
                    child: AppText(
                      dateTime.dateFormat(),
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
      ],
    );
  }
}
