import 'package:flutter/material.dart';
import 'package:bmi_calculator/styles/styles.dart';

// ignore: must_be_immutable
class ResultButton extends StatelessWidget {
  ResultButton({super.key, required this.onPress, required this.title});

  void Function()? onPress;
  String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        height: 65.0,
        padding: const EdgeInsets.all(10.0),
        color: kResultColor,
        child: Text(
          title,
          style: kTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
