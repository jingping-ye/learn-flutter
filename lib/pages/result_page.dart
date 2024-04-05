import 'dart:math';

import 'package:bmi_calculator/components/app_main.dart';
import 'package:bmi_calculator/components/general_card.dart';
import 'package:bmi_calculator/components/result_button.dart';
import 'package:bmi_calculator/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum BMIStatus { underweight, normalWeight, overWeight }

Map<BMIStatus, Map> bmiStatus = {
  BMIStatus.underweight: {
    'title': '消瘦',
    'tip': '当前太瘦了，尝试多吃一点东西吧!',
    'color': const Color(0xffe4b9b9),
  },
  BMIStatus.normalWeight: {
    'title': '正常',
    'tip': '当前状态不错，继续保持！',
    'color': const Color(0xff4caf50),
  },
  BMIStatus.overWeight: {
    'title': '超重',
    'tip': '当前太重了，尝试运动或者少吃一点。',
    'color': const Color(0xfff56c6c),
  }
};

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.height,
      required this.age,
      required this.weight});
  final double height;
  final int age;
  final int weight;

  @override
  Widget build(BuildContext context) {
    double bmiIndex = weight / pow((height / 100), 2);
    BMIStatus currentBMIStatus;

    if (bmiIndex > 24) {
      currentBMIStatus = BMIStatus.overWeight;
    } else if (bmiIndex > 18.5) {
      currentBMIStatus = BMIStatus.normalWeight;
    } else {
      currentBMIStatus = BMIStatus.underweight;
    }

    return AppMain(
      body: Column(
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                '结果',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                  color: kMainBodyTextColor,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: GeneralCard(
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          bmiStatus[currentBMIStatus]?['title'],
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w300,
                            color: bmiStatus[currentBMIStatus]?['color'],
                          ),
                        ),
                        Text(
                          bmiIndex.toStringAsFixed(1),
                          style: const TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              color: kMainBodyTextColor),
                        ),
                        Text(
                          bmiStatus[currentBMIStatus]?['tip'],
                          style: const TextStyle(
                              fontSize: 12.0, color: kMainBodyTextColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          ResultButton(
              onPress: () {
                Navigator.pop(context);
              },
              title: '重新计算'),
        ],
      ),
      showAppBar: false,
    );
  }
}
