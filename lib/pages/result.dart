import 'package:bmi/constants.dart';
import 'package:bmi/includes/bottom_button.dart';
import 'package:bmi/includes/home/reusable_card.dart';
import 'package:bmi/models/calculator_brain.dart';
import 'package:flutter/material.dart';


class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.weight, required this.height}) : super(key: key);
  final int weight;
  final int height;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late CalculatorBrain _bmiBrain;
  @override
  void initState() {
    _bmiBrain = CalculatorBrain(
        weight: widget.weight,
        height: widget.height
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('YOUR BMI'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
                    child: Center(
                      child: Text(
                        'Your Result',
                        style: kResultTitle,
                      ),
                    )
                )
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: activeColorCard,
                cardChild: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        _bmiBrain.getResult().toUpperCase(),
                        style: kOverWeight,
                      ),
                      Text(
                        _bmiBrain.getBmi,
                        style: kTextResult,
                      ),
                      Text(
                        'Your BMI result is quite low, you should eat more',
                        style: kResultSub,
                      )
                    ],
                  ),
                ),
              ),
            ),
            BottomButton(
                onTab: () {
                  Navigator.pop(context);
                },
                title: 'RE-CALCULATOR'
            )
          ],
        )
    );
  }
}