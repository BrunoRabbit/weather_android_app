import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view_model.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class HistoryContent extends StatefulWidget {
  const HistoryContent(
    this.homeViewModel,
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  final HomeViewModel homeViewModel;
  final VisibilityViewModel viewModel;

  @override
  State<HistoryContent> createState() => _HistoryContentState();
}

class _HistoryContentState extends State<HistoryContent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Observer(
        builder: (context) {
          final item = widget.viewModel.history[widget.viewModel.currentIndex];

          return ListView.builder(
            itemCount: item.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // ? Icon
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 16),
                          child: Icon(
                            item.reversed.toList()[index].icon,
                            color: Colors.white,
                            size: 34,
                          ),
                        ),

                        // ? Visibility
                        AppText(
                          item.reversed.toList()[index].visibility.toString(),
                          style: TextUtility.headline3.copyWith(
                            color: Colors.white,
                            fontFamily: 'Nunito-Medium',
                          ),
                        ),
                        const Spacer(),

                        // ? Time ago
                        AppText(
                          item.reversed.toList()[index].dateTime,
                          style: TextUtility.body1.copyWith(
                            color: Colors.white,
                            fontFamily: 'Nunito-Medium',
                          ),
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
