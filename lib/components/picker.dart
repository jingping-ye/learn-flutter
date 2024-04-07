import 'package:bitcoin_ticker/components/android_picker.dart';
import 'package:bitcoin_ticker/components/ios_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;

// ignore: must_be_immutable
class Picker extends StatefulWidget {
  Picker({super.key, required this.onChange});
  Function onChange;

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? AndroidPicker(
            onChange: widget.onChange,
          )
        : (Platform.isIOS
            ? IosPicker(
                onChange: widget.onChange,
              )
            : AndroidPicker(onChange: widget.onChange));
  }
}
