import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/home/view/home_view.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view_model.dart';
import 'package:weather_android_app/modules/visibility/view/widgets/date_list.dart';
import 'package:weather_android_app/modules/visibility/view/widgets/history_content.dart';
import 'package:weather_android_app/modules/visibility/view/widgets/semi_circle_widget.dart';
import 'package:weather_android_app/routes/app_routes.dart';
import 'package:weather_android_app/utils/extensions/date_extensions.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class MainContent extends StatefulWidget {
  const MainContent({
    Key? key,
    required this.homeViewModel,
  }) : super(key: key);

  final HomeViewModel homeViewModel;

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  final VisibilityViewModel viewModel = VisibilityViewModel();

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

            // ? Date Time now
            Observer(
              builder: (context) {
                final dayMonth = widget.homeViewModel.userLocation!.results!
                    .forecast![viewModel.currentIndex].date!;
                final year = widget.homeViewModel.userLocation!.results!.date!
                    .substring(6, 10);
                final dateTime = '$dayMonth/$year';

                return widget.homeViewModel.userLocation != null
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

            // ? SemiCirle custom paint
            SemiCircleWidget(widget.homeViewModel, viewModel),

            const SizedBox(
              height: 30,
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
                    widget.homeViewModel.userLocation!.results!.date!
                        .monthFormat(),
                    style: TextUtility.body1.copyWith(
                      color: Colors.black,
                      fontFamily: 'Nunito-Medium',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // ? Date list
            DateList(widget.homeViewModel, viewModel),
            
            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 6),
              child: AppText(
                'Histórico',
                style: TextUtility.body1.copyWith(
                  color: Colors.black,
                  fontFamily: 'Nunito-Medium',
                ),
              ),
            ),
            const SizedBox(height: 4),

            // ? Historic
            HistoryContent(widget.homeViewModel, viewModel)
          ],
        ),
      ),
    );
  }
}
