import 'package:bmi/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0C24),
        scaffoldBackgroundColor: Color(0xFF0A0C24)
      ),
      initialRoute: RouteGenerator.ROUTE_HOME,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

