import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:location/location.dart';
import 'package:weather_android_app/modules/home/entity/user_lat_long.dart';
import 'package:weather_android_app/modules/home/presenter/home_presenter.dart';
import 'package:weather_android_app/modules/home/view/widgets/weather_main_content.dart';
import 'package:weather_android_app/modules/home/view/widgets/weather_week.dart';
import 'package:weather_android_app/modules/splash/view/splash_view.dart';
import 'package:weather_android_app/routes/app_routes.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Size size;
  late UserLatLong userLatLong;
  HomePresenter presenter = HomePresenter();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: 0.0,
      duration: const Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..stop(canceled: true); // ..repeat();

    checkServiceLocation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Observer(
        builder: (_) => presenter.userLocation != null
            ? Column(
                children: [
                  // ? animated container & today weather info
                  WeatherMainContent(
                    size: size,
                    controller: _controller,
                    userLocation: presenter.userLocation,
                  ),

                  // ? week weather info
                  WeatherWeek(
                    userLocation: presenter.userLocation,
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

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

  Future askDeviceLocation(Location location) async {
    PermissionStatus permissionGranted = await location.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => displayDialog(context),
        );
        return;
      }
    }
    if (permissionGranted == PermissionStatus.granted) {
      LocationData locationData = await location.getLocation();

      userLatLong = UserLatLong(
        latitude: locationData.latitude,
        longitude: locationData.longitude,
      );

      await presenter.getUserLocationData(userLatLong);
    }
  }

  // ! Case user deny permission, show Dialog and logOut
  Future<void> displayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Você recusou a permissão'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                  'Para utilizar o aplicativo é necessaria a permição da sua localização.'),
              Text('Não utilizaremos sua localização sem seu consentimento.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              // TODO- LOGOUT
              Navigator.of(context).pushReplacement(
                AppRouter.createRoute(
                  const SplashView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
