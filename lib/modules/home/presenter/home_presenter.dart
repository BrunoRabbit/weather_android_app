import 'package:location/location.dart';
import 'package:weather_android_app/modules/home/entity/user_lat_long.dart';
import 'package:weather_android_app/modules/home/interactor/home_interactor.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';

class HomePresenter {
  HomePresenter(this.homeViewModel);

  HomeViewModel homeViewModel;
  HomeInteractor interactor = HomeInteractor();

  // * [checkServiceLocation] and [askDeviceLocation] both is to verify if device
  // * can use location services, and if enable, ask for user permission
  Future checkServiceLocation() async {
    Location location = Location();

    bool serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) return;
    }

    await askDeviceLocation(location);
  }

  Future<void> askDeviceLocation(Location location) async {
    PermissionStatus permissionGranted = await location.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        homeViewModel.isDisplayedDialog = true;
        return;
      }
    }
    if (permissionGranted == PermissionStatus.granted) {
      LocationData locationData = await location.getLocation();

      var userLatLong = UserLatLong(
        latitude: locationData.latitude,
        longitude: locationData.longitude,
      );

      homeViewModel.userLocation = await interactor.fetchUserData(userLatLong);
    }
  }

  Future<void> getCityData(String name) async {
    homeViewModel.userLocation = await interactor.fetchCityData(name);
  }
}
