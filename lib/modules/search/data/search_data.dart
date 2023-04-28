import 'dart:convert';

import 'package:weather_android_app/modules/home/data/home_data.dart';
import 'package:weather_android_app/modules/home/entity/user_location.dart';
import 'package:http/http.dart' as http;

class SearchData {
  Future<UserLocation> searchLocation(String name) async {
    try {
      final response = await http.get(
        Uri.parse(
          "https://api.hgbrasil.com/weather?key=${HomeData.key}&city_name=$name",
        ),
      );
      Map<String, dynamic> activity = jsonDecode(response.body);

      return UserLocation.fromMap(activity);
    } catch (e) {
      rethrow;
    }
  }
}
