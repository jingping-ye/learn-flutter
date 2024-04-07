import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/data/coin_dart.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class IosPicker extends StatefulWidget {
  IosPicker({super.key, required this.onChange});

  Function onChange;

  @override
  State<IosPicker> createState() => _IosPickerState();
}

class _IosPickerState extends State<IosPicker> {
  String selectedCurrency = currencyList.first;
  List<Widget> getPickerItems() {
    List<Widget> items = [];
    for (String currency in currencyList) {
      items.add(
        Text(
          currency,
          style: const TextStyle(color: Colors.white),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 30.0,
      onSelectedItemChanged: (newIndex) {
        selectedCurrency = currencyList[newIndex];
        widget.onChange(selectedCurrency);
      },
      children: getPickerItems(),
    );
  }
}
