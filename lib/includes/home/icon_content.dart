import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({ Key? key, required this.text, required this.icon }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
            icon,
            size: 80
        ),
        SizedBox(
            height: 15
        ),
        Text(
            text,
            style: TextStyle(
                fontSize: 18,
                color: Color(0xFF8D8E98)
            )
        )
      ],
    );
  }
}