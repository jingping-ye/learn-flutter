import 'package:bmi_calculator/components/general_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/styles/styles.dart';

class GenderCard extends StatefulWidget {
  const GenderCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.backgroundColor,
      required this.onClick});
  final IconData icon;
  final String title;
  final Color backgroundColor;
  final void Function()? onClick;

  @override
  State<GenderCard> createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: GeneralCard(
        child: Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(widget.icon, size: 30.00, color: kMainBodyTextColor),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.title,
                style: kSecondTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
