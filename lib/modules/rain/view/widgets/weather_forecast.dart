import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/modules/home/entity/user_location.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view_model.dart';
import 'package:weather_android_app/utils/utility/text_utility.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({
    Key? key,
    required this.item,
    required this.viewModel,
  }) : super(key: key);

  final Results item;
  final VisibilityViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final styleTextTitle = TextUtility.body1.copyWith(
      fontFamily: 'Nunito-Medium',
    );
    final styleTextInformation = TextUtility.body1.copyWith(
      fontFamily: 'Nunito-Bold',
      fontSize: 18,
    );

    return Expanded(
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        color: Colors.purple,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/wind_speed.svg',
                    height: 80,
                    color: Colors.white,
                  ),
                  AppText(
                    'Vel. do vento',
                    style: styleTextTitle,
                  ),
                  AppText(
                    item.forecast![viewModel.currentIndex].windSpeedy!,
                    style: styleTextInformation,
                  ),
                ],
              ),
            ),
            const VerticalDivider(
              color: Colors.grey,
              thickness: 1,
              width: 15,
              indent: 40,
              endIndent: 40,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    'Condição atual:',
                    style: styleTextTitle,
                  ),
                  AppText(
                    item.forecast![viewModel.currentIndex].description!,
                    style: styleTextInformation,
                  ),
                  const SizedBox(height: 10),
                  AppText(
                    'Ultima atualização:',
                    style: styleTextTitle,
                  ),
                  AppText(
                    item.time!,
                    style: styleTextInformation,
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
