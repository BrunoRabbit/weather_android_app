import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view_model.dart';
import 'package:weather_android_app/utils/extensions/date_extensions.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class DateList extends StatelessWidget {
  const DateList(
    this.homeViewModel,
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  final HomeViewModel homeViewModel;
  final VisibilityViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final user = homeViewModel.userLocation!.results!.forecast![index];

          return Observer(
            builder: (context) => GestureDetector(
              onTap: () {
                viewModel.changeIndex(index);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 2,
                  vertical: 6,
                ),
                child: Container(
                  height: 60,
                  width: 50,
                  decoration: BoxDecoration(
                    color: viewModel.currentIndex == index
                        ? Colors.grey[300]
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // ? week name
                        AppText(
                          user.weekday ?? 'UNK',
                          style: TextUtility.body2.copyWith(
                            color: viewModel.currentIndex == index
                                ? Colors.black
                                : Colors.grey[500],
                            fontFamily: 'Nunito-Regular',
                          ),
                        ),

                        // ? week day
                        AppText(
                          user.date!.extractDayFromDateString(),
                          style: TextUtility.body2.copyWith(
                            color: viewModel.currentIndex == index
                                ? Colors.black
                                : Colors.grey[500],
                            fontFamily: 'Nunito-Regular',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
