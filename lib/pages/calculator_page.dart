import 'package:bmi_calculator/components/app_main.dart';
import 'package:bmi_calculator/components/height_slider.dart';
import 'package:bmi_calculator/components/result_button.dart';
import 'package:bmi_calculator/components/select_gender.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/styles/styles.dart';
import 'package:bmi_calculator/components/wh.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

double height = 180;
int age = 22;
int weight = 60;

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return AppMain(
      body: Container(
        color: kMainBodyBackgroundColor,
        child: Column(children: [
          const Expanded(
            child: SelectGender(),
          ),
          Expanded(
            child: HeightSlider(
              height: height,
              callback: (newValue) {
                height = newValue.round();
              },
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: WhCard(
                    value: weight,
                    title: '体重(kg)',
                    callback: (newValue) {
                      weight = newValue;
                    },
                  ),
                ),
                Expanded(
                  child: WhCard(
                    value: age,
                    title: '年龄',
                    callback: (newValue) {
                      age = newValue;
                    },
                  ),
                ),
              ],
            ),
          ),
          ResultButton(
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(height: height, age: age, weight: weight);
              }));
            },
            title: '计算',
          ),
        ]),
      ),
    );
  }
}
