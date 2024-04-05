import 'package:flutter/material.dart';
import 'package:bmi_calculator/styles/styles.dart';

class AppMain extends StatefulWidget {
  const AppMain({super.key, required this.body, this.showAppBar = true});
  final Widget body;
  final bool showAppBar;

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              elevation: 4,
              backgroundColor: kAppBarBackgroundColor,
              title: const Center(
                child: Text(
                  'BMI 计算器',
                  style: TextStyle(
                    fontSize: 18,
                    color: kMainBodyTextColor,
                  ),
                ),
              ),
            )
          : null,
      body: SafeArea(
        child: widget.body,
      ),
    );
  }
}
