import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:weather_android_app/components/app_text.dart';
import 'package:weather_android_app/components/transparent_app_bar.dart';
import 'package:weather_android_app/modules/auth/auth_store.dart';
import 'package:weather_android_app/modules/home/presenter/home_presenter.dart';
import 'package:weather_android_app/modules/home/view/home_view_model.dart';
import 'package:weather_android_app/modules/home/view/widgets/main_drawer.dart';
import 'package:weather_android_app/modules/home/view/widgets/weather_main_content.dart';
import 'package:weather_android_app/modules/home/view/widgets/weather_week.dart';
import 'package:weather_android_app/modules/search/presenter/search_presenter.dart';
import 'package:weather_android_app/modules/search/view/search_view_model.dart';
import 'package:weather_android_app/modules/splash/view/splash_view.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view_model.dart';
import 'package:weather_android_app/routes/app_routes.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  final HomeViewModel _homeViewModel = HomeViewModel();
  final SearchViewModel _searchViewModel = SearchViewModel();
  final VisibilityViewModel _viewModel = VisibilityViewModel();
  AuthStore authStore = AuthStore();

  late AnimationController _controller;
  late Size size;
  late HomePresenter presenter;
  late SearchPresenter searchPresenter;

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

    presenter = HomePresenter(_homeViewModel);
    presenter.checkServiceLocation();

    searchPresenter = SearchPresenter(
      _searchViewModel,
      _homeViewModel,
    );
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
      appBar: TransparentAppBar.withTitleObserver(
        isActionEnabled: true,
        titleBuilder: (context) {
          return _homeViewModel.userLocation != null
              ? AppText(
                  _homeViewModel.userLocation!.results!.city!,
                  size: 20,
                )
              : Container();
        },
        onPressed: () {
          authStore.logout();
          Navigator.of(context).pushReplacement(
            AppRouter.createRoute(
              const SplashView(),
            ),
          );
        },
      ),
      drawer: MainDrawer(
        homeViewModel: _homeViewModel,
        viewModel: _viewModel,
      ),
      body: Observer(
        builder: (context) {
          if (_homeViewModel.isDisplayedDialog) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => displayDialog(context, authStore),
            );
            _homeViewModel.isDisplayedDialog = false;
          }
          return _homeViewModel.userLocation != null
              ? Column(
                  children: [
                    // ? animated container & today weather info
                    WeatherMainContent(
                      size: size,
                      controller: _controller,
                      homeViewModel: _homeViewModel,
                      presenter: searchPresenter,
                      searchViewModel: _searchViewModel,
                    ),

                    // ? week weather info
                    WeatherWeek(
                      userLocation: _homeViewModel.userLocation,
                      viewModel: _viewModel,
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

// ! Case user deny permission, show Dialog and logOut
Future<void> displayDialog(
    BuildContext context, AuthStore authStore) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const AppText(
        'Você recusou a permissão',
        family: 'SemiBold',
        color: Colors.black87,
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            AppText(
              'Para utilizar o aplicativo é necessaria a permição da sua localização.',
              family: 'Medium',
              color: Colors.black87,
            ),
            SizedBox(
              height: 10,
            ),
            AppText(
              'Não utilizaremos sua localização sem seu consentimento.',
              color: Colors.black87,
              family: 'Medium',
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const AppText(
            'Ok',
            color: Colors.black87,
            family: 'Medium',
          ),
          onPressed: () {
            authStore.logout();
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
