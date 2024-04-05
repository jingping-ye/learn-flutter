import 'package:flutter/material.dart';
import 'package:bmi_calculator/styles/styles.dart';

class GeneralCard extends StatelessWidget {
  const GeneralCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: kCardColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: child,
    );
  }
}
