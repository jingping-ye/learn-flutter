import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/data/coin_dart.dart';

// ignore: must_be_immutable
class AndroidPicker extends StatefulWidget {
  AndroidPicker({super.key, required this.onChange});
  Function onChange;

  @override
  State<AndroidPicker> createState() => _AndroidPickerState();
}

class _AndroidPickerState extends State<AndroidPicker> {
  String selectedCurrency = currencyList.first;

  getDropDownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currencyList) {
      DropdownMenuItem<String> newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      iconEnabledColor: Colors.white,
      dropdownColor: const Color(0xff393639),
      style: const TextStyle(color: Colors.white),
      value: selectedCurrency,
      items: getDropDownItems(),
      onChanged: (newValue) {
        setState(
          () {
            selectedCurrency = newValue!;
            widget.onChange(selectedCurrency);
          },
        );
      },
    );
  }
}
