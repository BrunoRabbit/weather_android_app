import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_android_app/modules/home/entity/user_lat_long.dart';
import 'package:weather_android_app/modules/home/entity/user_location.dart';
import 'package:http/http.dart' as http;

class HomeData {
  Future<UserLocation> getLocation(UserLatLong userLatLong) async {
    String key = dotenv.get('API_KEY');
    try {
      final response = await http.get(
        Uri.parse(
          "https://api.hgbrasil.com/weather?key=$key&lat=${userLatLong.latitude}&lon=${userLatLong.longitude}&user_ip=remote",
        ),
      );
      Map<String, dynamic> activity = jsonDecode(response.body);

      return UserLocation.fromMap(activity);
    } catch (e) {
      rethrow;
    }
  }
}
