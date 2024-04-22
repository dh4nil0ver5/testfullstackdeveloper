import 'package:fe_test/container/home/view/home_page.dart';
import 'package:fe_test/container/landing/landing_page.dart';
import 'package:fe_test/container/login/login_page.dart';
import 'package:fe_test/container/splash/splash.dart';
import 'package:flutter/material.dart';

class Routing {
  static Route<void> getRoute(String routeName) {
    switch (routeName) {
      case 'splash':
        return _buildRoute(const SplashPage());
      case 'login':
        return _buildRoute(const LoginPage());
      case 'landing':
        return _buildRoute(const LandingPage());
      default:
        throw Exception('Unknown route: $routeName');
    }
  }

  static MaterialPageRoute<void> _buildRoute(Widget page) {
    return MaterialPageRoute<void>(builder: (_) => page);
  }
}