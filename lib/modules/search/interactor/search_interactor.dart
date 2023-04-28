import 'package:weather_android_app/modules/home/entity/user_location.dart';
import 'package:weather_android_app/modules/search/data/search_data.dart';

class SearchInteractor {
  final SearchData _searchData = SearchData();

  Future<UserLocation> fetchCityData(String name) async {
    return await _searchData.searchLocation(name);
  }
}