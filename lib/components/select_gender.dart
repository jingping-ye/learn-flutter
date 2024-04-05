import 'package:bmi_calculator/components/gender_card.dart';
import 'package:bmi_calculator/styles/icon.dart';
import 'package:bmi_calculator/styles/styles.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class SelectGender extends StatefulWidget {
  const SelectGender({super.key});

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GenderCard(
            onClick: () {
              setState(() {
                selectedGender = Gender.male;
              });
            },
            icon: kMale,
            title: '男性',
            backgroundColor:
                selectedGender == Gender.male ? kCardActiveColor : kCardColor,
          ),
        ),
        Expanded(
          child: GenderCard(
            onClick: () {
              setState(() {
                selectedGender = Gender.female;
              });
            },
            icon: kFemale,
            title: '女性',
            backgroundColor:
                selectedGender == Gender.female ? kCardActiveColor : kCardColor,
          ),
        ),
      ],
    );
  }
}
