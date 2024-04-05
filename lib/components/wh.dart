import 'package:bmi_calculator/components/general_card.dart';
import 'package:bmi_calculator/styles/icon.dart';
import 'package:bmi_calculator/styles/styles.dart';
import 'package:flutter/material.dart';

//// 身高体重卡片

// ignore: must_be_immutable
class WhCard extends StatefulWidget {
  WhCard(
      {super.key,
      required this.value,
      required this.title,
      required this.callback});

  int value;
  String title;
  Function callback;

  @override
  State<WhCard> createState() => _WhCardState();
}

class _WhCardState extends State<WhCard> {
  @override
  Widget build(BuildContext context) {
    return GeneralCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.title, style: kSecondTextStyle),
          Text(widget.value.toString(), style: kTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                mini: true,
                shape: const CircleBorder(),
                backgroundColor: kButtonBackgroundColor,
                onPressed: () {
                  setState(() {
                    widget.value--;
                  });
                  widget.callback(widget.value);
                },
                child: const Icon(
                  kMinus,
                  color: Colors.white,
                  size: 12.0,
                ),
              ),
              const SizedBox(width: 10.0),
              FloatingActionButton(
                mini: true,
                shape: const CircleBorder(),
                backgroundColor: kButtonBackgroundColor,
                onPressed: () {
                  setState(() {
                    widget.value++;
                  });
                  widget.callback(widget.value);
                },
                child: const Icon(
                  kPlus,
                  color: kButtonColor,
                  size: 12.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
