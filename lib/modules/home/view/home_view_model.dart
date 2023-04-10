// ignore_for_file: library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:weather_android_app/modules/home/entity/user_lat_long.dart';
import 'package:weather_android_app/modules/home/entity/user_location.dart';
import 'package:weather_android_app/modules/home/interactor/home_interactor.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  HomeInteractor interactor = HomeInteractor();
  
  @observable
  bool isDisplayedDialog = false;
  
  @observable
  UserLocation? userLocation;

  @action
  Future<UserLocation> setupPresenter(UserLatLong entity) async {
    return userLocation = await interactor.fetchData(entity);
  }
}




