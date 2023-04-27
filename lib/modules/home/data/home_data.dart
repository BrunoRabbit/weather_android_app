import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_android_app/modules/home/entity/user_lat_long.dart';
import 'package:weather_android_app/modules/home/entity/user_location.dart';
import 'package:http/http.dart' as http;

class HomeData {
  static final String _key = dotenv.get('API_KEY');

  Future<UserLocation> getLocation(UserLatLong userLatLong) async {
    try {
      final response = await http.get(
        Uri.parse(
          "https://api.hgbrasil.com/weather?key=$_key&lat=${userLatLong.latitude}&lon=${userLatLong.longitude}&user_ip=remote",
        ),
      );
      Map<String, dynamic> activity = jsonDecode(response.body);

      return UserLocation.fromMap(activity);
    } catch (e) {
      rethrow;
    }
  }

  Future<UserLocation> searchLocation(String name) async {
    try {
      final response = await http.get(
        Uri.parse(
          "https://api.hgbrasil.com/weather?key=$_key&city_name=$name",
        ),
      );
      Map<String, dynamic> activity = jsonDecode(response.body);

      return UserLocation.fromMap(activity);
    } catch (e) {
      rethrow;
    }
  }
}
