import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:weather_android_app/modules/home/entity/user_location.dart';
import 'package:weather_android_app/utility/text_utility.dart';

enum WeatherDescription {
  parcialmenteNublado,
  chuva,
  chuvasEsparsas,
  tempoNublado,
  tempoLimpo,
}

class WeatherWeek extends StatelessWidget {
  const WeatherWeek({
    Key? key,
    this.userLocation,
  }) : super(key: key);

  final UserLocation? userLocation;

  @override
  Widget build(BuildContext context) {
    final weekDetails = userLocation?.results?.forecast;
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0, bottom: 12),
        itemCount: weekDetails!.length - 3,
        itemExtent: 65,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Material(
              elevation: 8,
              color: Colors.grey[100],
              borderRadius: const BorderRadius.all(
                Radius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    _CustomText(
                      _getWeekDay(weekDetails[index + 1].weekday!),
                      style: TextUtility.subtitle2.medium.copyWith(
                        color: const Color(0xFF969696),
                        fontFamily: 'Nunito-Bold',
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    _CustomText(
                      "${weekDetails[index + 1].max}°",
                    ),
                    const SizedBox(width: 14),
                    Icon(
                      getIconData(weekDetails[index + 1].description!),
                      color: const Color(0xFF969696),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _getWeekDay(String day) {
    Map<String, String> weekDay = {
      "Seg": "Segunda",
      "Ter": "Terça",
      "Qua": "Quarta",
      "Qui": "Quinta",
      "Sex": "Sexta",
      "Sáb": "Sábado",
      "Dom": "Domingo",
    };

    return weekDay[day]!;
  }

  // * transform letter to title format: example, somethingTodo => Something todo
  String titleFormat(String description) {
    String result = "";
    bool newWord = true;

    for (int i = 0; i < description.length; i++) {
      if (newWord) {
        result += description[i].toUpperCase();
        newWord = false;
      } else {
        if (description[i] == description[i].toUpperCase()) {
          result += ' ';
        }
        result += description[i].toLowerCase();
      }

      if (description[i] == ' ') {
        newWord = true;
      }
    }

    return result;
  }

  IconData getIconData(String details) {
    String txt = details;
    
    if (txt
        .contains(titleFormat(WeatherDescription.parcialmenteNublado.name))) {
      return FontAwesomeIcons.cloudSun;
    }
    if (txt.contains(titleFormat(WeatherDescription.chuva.name))) {
      return FontAwesomeIcons.cloudRain;
    }
    if (txt.contains(titleFormat(WeatherDescription.tempoLimpo.name))) {
      return FontAwesomeIcons.solidSun;
    }
    if (txt.contains(titleFormat(WeatherDescription.chuvasEsparsas.name))) {
      return FontAwesomeIcons.cloudSunRain;
    }
    if (txt.contains(titleFormat(WeatherDescription.tempoNublado.name))) {
      return FontAwesomeIcons.cloud;
    }
    return Icons.image_not_supported_outlined;
  }
}

class _CustomText extends StatelessWidget {
  const _CustomText(
    this.text, {
    this.style,
    Key? key,
  }) : super(key: key);

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextUtility.headline3.medium.copyWith(
            color: const Color(0xFF969696),
            fontFamily: 'Nunito-Bold',
            fontSize: 20,
          ),
    );
  }
}
