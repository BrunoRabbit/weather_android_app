// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:weather_android_app/modules/home/entity/user_lat_long.dart';
import 'package:weather_android_app/modules/home/entity/user_location.dart';
import 'package:weather_android_app/modules/home/interactor/home_interactor.dart';

part 'home_presenter.g.dart';

class HomePresenter = _HomePresenter with _$HomePresenter;

abstract class _HomePresenter with Store {
  HomeInteractor interactor = HomeInteractor();
  
  @observable
  UserLocation? userLocation;

  @action
  Future<UserLocation> getUserLocationData(UserLatLong entity) async {
    return userLocation = await interactor.fetchData(entity);
  }
}
