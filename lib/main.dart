import 'package:bmi_calculator/pages/calculator_page.dart';
import 'package:bmi_calculator/styles/styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CalculatorPage(),
      theme: ThemeData(
        shadowColor: Theme.of(context).colorScheme.shadow,
        primaryColor: kAppBarBackgroundColor,
        scaffoldBackgroundColor: kMainBodyBackgroundColor,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: kMainBodyTextColor,
          ),
          bodySmall: TextStyle(
            color: kMainBodyTextColor,
          ),
          bodyLarge: TextStyle(
            color: kMainBodyTextColor,
          ),
        ),
      ),
    );
  }
}
