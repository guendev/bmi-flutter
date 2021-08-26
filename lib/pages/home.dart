import 'package:bmi/includes/bottom_button.dart';
import 'package:bmi/includes/home/icon_content.dart';
import 'package:bmi/includes/home/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

enum Gender { male, female }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<HomePage> {
  Gender? genderSelected;
  late int height = 180;
  late int weight = 50;
  late int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      genderSelected = Gender.male;
                    });
                  },
                  colour: genderSelected == Gender.male
                      ? activeColorCard
                      : inactiveColorCard,
                  cardChild: IconContent(
                    text: 'MALE',
                    icon: FontAwesomeIcons.mars,
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      genderSelected = Gender.female;
                    });
                  },
                  colour: genderSelected == Gender.female
                      ? activeColorCard
                      : inactiveColorCard,
                  cardChild: IconContent(
                    text: 'FEMALE',
                    icon: FontAwesomeIcons.venus,
                  ),
                ))
              ],
            )),
            Expanded(
                child: ReusableCard(
              colour: activeColorCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: labelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: heightLabel,
                      ),
                      Text(
                        'cm',
                        style: labelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFFF0051),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF888994),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                child: Row(
                    children: [
                      Expanded(
                          child: ReusableCard(
                            colour: activeColorCard,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'WEIGHT',
                                  style: labelStyle,
                                ),
                                Text(
                                  weight.toString(),
                                  style: heightLabel,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      iconData: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          if(weight > 0) {
                                            weight--;
                                          }
                                        });
                                      },
                                    ),
                                    RoundIconButton(
                                      iconData: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                      ),
                      Expanded(
                          child: ReusableCard(
                            colour: activeColorCard,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'AGE',
                                  style: labelStyle,
                                ),
                                Text(
                                  age.toString(),
                                  style: heightLabel,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      iconData: FontAwesomeIcons.minus,
                                      onPressed: () {
                                        setState(() {
                                          if(age > 0) {
                                            age--;
                                          }
                                        });
                                      },
                                    ),
                                    RoundIconButton(
                                      iconData: FontAwesomeIcons.plus,
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                      ))
                    ],
                )
            ),
            BottomButton(
              title: 'CALCULATOR',
              onTab: () {
                Navigator.pushNamed(context, '/result', arguments: { 'weight': weight, 'height': height });
              },
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.iconData, required this.onPressed}) : super(key: key);

  final IconData iconData;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Icon(iconData),
      style: TextButton.styleFrom(
        primary: Colors.white,
        shape: CircleBorder(),
        padding: EdgeInsets.all(16),
        backgroundColor: Color(0xFF4C4F5E)
      ),
    );
  }
}

