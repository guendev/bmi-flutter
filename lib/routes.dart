import 'package:bmi/pages/home.dart';
import 'package:bmi/pages/result.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const ROUTE_HOME = '/';
  static const ROUTE_RESULT = '/result';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ROUTE_RESULT:
        return MaterialPageRoute(builder: (context) =>
            ResultPage(
                weight: _screenArguments(settings, 'weight'),
                height: _screenArguments(settings, 'height')
            )
        );
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
  static _screenArguments(settings, key) {
    return settings.arguments[key];
  }
}