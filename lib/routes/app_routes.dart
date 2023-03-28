import 'package:flutter/material.dart';

import 'package:weather_android_app/modules/home/view/home_view.dart';
import 'package:weather_android_app/modules/register/view/register_view.dart';
import 'package:weather_android_app/modules/splash/view/splash_view.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String register = '/register';
}

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return createRoute(const SplashView());

      case AppRoutes.home:
        return createRoute(const HomeView());
      
      case AppRoutes.register:
        return createRoute(const RegisterView());
        
        
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
