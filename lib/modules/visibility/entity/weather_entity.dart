import 'dart:async';
import 'package:flutter/material.dart';

class WeatherEntity {
  WeatherEntity({
    required this.icon,
    required this.visibility,
    required this.dateTime,
  });

  IconData icon;
  double visibility;
  String dateTime;
  DateTime? dateNow;

  WeatherEntity.createNewItem(
      this.icon, this.visibility, this.dateTime, this.dateNow) {
    Timer? timer;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();
      Duration difference = now.difference(dateNow!);

      if (difference.inDays > 0) {
        dateTime = '${difference.inDays} dias atrás';
      } else if (difference.inHours > 0) {
        dateTime = '${difference.inHours} horas atrás';
      } else if (difference.inMinutes > 0) {
        dateTime = '${difference.inMinutes} minutos atrás';
      } else {
        dateTime = '${difference.inSeconds} segundos atrás';
      }
    });

    Timer(const Duration(hours: 23, minutes: 59), () {
      timer?.cancel();
    });
  }
}
