import 'package:weather_android_app/modules/home/data/home_data.dart';
import 'package:weather_android_app/modules/home/entity/user_lat_long.dart';
import 'package:weather_android_app/modules/home/entity/user_location.dart';

class HomeInteractor {
  final HomeData _homeData = HomeData();

  Future<UserLocation> fetchUserData(UserLatLong entity) async {
    return await _homeData.getLocation(entity);
  }
}