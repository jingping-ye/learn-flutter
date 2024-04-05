import 'package:bmi_calculator/components/general_card.dart';
import 'package:bmi_calculator/styles/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeightSlider extends StatefulWidget {
  HeightSlider({super.key, this.height = 160.0, required this.callback});

  // 初始身高
  double height;
  Function callback;

  @override
  State<HeightSlider> createState() => _HeightSliderState();
}

class _HeightSliderState extends State<HeightSlider> {
  @override
  Widget build(BuildContext context) {
    return GeneralCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            '身高',
            style: kSecondTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                widget.height.round().toString(),
                style: kTextStyle,
              ),
              const Text(
                'cm',
                style: kThirdTextStyle,
              ),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: kSliderActiveColor,
              inactiveTrackColor: kSliderInactiveColor,
              thumbColor: kSliderActiveColor,
              overlayColor: kSlideroverlayColor,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
            ),
            child: Slider(
              min: 60.0,
              max: 250.0,
              value: widget.height,
              onChanged: (newValue) {
                setState(() {
                  widget.height = newValue;
                });
                widget.callback(newValue);
              },
            ),
          )
        ],
      ),
    );
  }
}
