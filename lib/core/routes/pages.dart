import 'package:calculator_app/calculator_app.dart';
import 'package:basket_app/basket_app.dart';
import 'package:flutter/material.dart';
import 'package:lighter_app/lighter.dart';
import 'package:track1_project/core/routes/routes_name.dart';
import 'package:track1_project/pages/home_screen.dart';
import 'package:track1_project/pages/splash_screen.dart';
import 'package:xo_app/xo_app.dart';

class AppRoute {
  static Route<dynamic> generate(RouteSettings? settings) {
    switch (settings?.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (_) {
          return const SplashScreen();
        });
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) {
          return const HomeScreen();
        });
      case RoutesName.xoApp:
        return MaterialPageRoute(builder: (_) {
          return const XoApp();
        });
      case RoutesName.calculatorApp:
        return MaterialPageRoute(builder: (_) {
          return const CalculatorApp();
        });
      case RoutesName.basketApp:
        return MaterialPageRoute(builder: (_) {
          return const BasketAppScreen();
        });
      case RoutesName.lighterApp:
        return MaterialPageRoute(builder: (_) {
          return const LighterScreen();
        });
      default:
        throw Exception('Route not found!');
    }
  }
}