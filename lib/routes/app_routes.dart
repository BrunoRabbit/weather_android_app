import 'package:flutter/material.dart';
import 'package:weather_android_app/modules/home/view/home_view.dart';
import 'package:weather_android_app/modules/rain/view/rain_view.dart';
import 'package:weather_android_app/modules/register/view/register_view.dart';
import 'package:weather_android_app/modules/search/view/search_view.dart';
import 'package:weather_android_app/modules/splash/view/splash_view.dart';
import 'package:weather_android_app/modules/visibility/view/visibility_view.dart';

class AppRoutes {
  static const String kSplash = '/splash';
  static const String kHome = '/home';
  static const String kRegister = '/register';
  static const String kVisibility = '/visibility';
  static const String kHumidity = '/humidity';
  static const String kSearch = '/search';
}

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    final dynamic arguments = settings.arguments;

    switch (settings.name) {
      case AppRoutes.kSplash:
        return createRoute(const SplashView());

      case AppRoutes.kHome:
        return createRoute(const HomeView());

      case AppRoutes.kRegister:
        return createRoute(const RegisterView());

      case AppRoutes.kVisibility:
        return createRoute(VisibilityView(arguments, arguments));

      case AppRoutes.kHumidity:
        return createRoute(RainView(arguments, arguments));

      case AppRoutes.kSearch:
        return createRoute(SearchView(arguments, arguments));

      default:
        return createRoute(const SplashView());
    }
  }

  static Route createRoute(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
