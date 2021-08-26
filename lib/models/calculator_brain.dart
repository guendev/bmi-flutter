import 'dart:math';

class CalculatorBrain {
  late final int height;
  late final int weight;
  late final double bmi;

  CalculatorBrain({ required this.weight, required this.height }) {
    bmi = weight / pow(height/100, 2);
  }

  String get getBmi {
    return bmi.toStringAsFixed(2);
  }

  String getResult() {
    if(bmi >= 25) {
      return 'Overweight';
    } else if(bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}