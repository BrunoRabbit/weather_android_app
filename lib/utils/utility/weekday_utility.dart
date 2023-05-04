import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum WeatherDescription {
  parcialmenteNublado,
  chuva,
  chuvasEsparsas,
  tempoNublado,
  tempoLimpo,
  neblina,
}

class WeekDayUtility {
  // * transform letter to title format: example, somethingTodo => Something todo
  static String titleFormat(String description) {
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

  static IconData getIconData(String details) {
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
    if (txt.contains(titleFormat(WeatherDescription.neblina.name))) {
      return Icons.foggy;
    }
    
    return Icons.image_not_supported_outlined;
  }

  static String getWeekDay(String day) {
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
}