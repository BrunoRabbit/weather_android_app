import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_android_app/modules/home/presenter/home_presenter.dart';
import 'package:weather_android_app/modules/visibility/presenter/visibility_presenter.dart';
import 'package:weather_android_app/utility/date_extensions.dart';
import 'package:weather_android_app/utility/text_utility.dart';

class DateList extends StatelessWidget {
  DateList(
    this.presenter, {
    Key? key,
  }) : super(key: key);

  final HomePresenter presenter;

  final VisibilityPresenter _visibilityPresenter = VisibilityPresenter();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final user = presenter.userLocation!.results!.forecast![index];

          return Observer(
            builder: (context) => GestureDetector(
              onTap: () {
                _visibilityPresenter.changeIndex(index);
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
                    color: _visibilityPresenter.currentIndex == index
                        ? Colors.grey[300]
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          user.weekday ?? 'UNK',
                          style: TextUtility.body2.copyWith(
                            color: _visibilityPresenter.currentIndex == index
                                ? Colors.black
                                : Colors.grey[500],
                            fontFamily: 'Nunito-Regular',
                          ),
                        ),
                        Text(
                          user.date!.extractDayFromDateString(),
                          style: TextUtility.body2.copyWith(
                            color: _visibilityPresenter.currentIndex == index
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
