import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({ Key? key, required this.onTab, required this.title }) : super(key: key);

  final VoidCallback onTab;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        color: bottomColor,
        width: double.infinity,
        height: 80,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}