import 'package:bitcoin_ticker/components/picker.dart';
import 'package:bitcoin_ticker/data/coin_dart.dart';
import 'package:bitcoin_ticker/service/biticon.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCrypto = cryptoList.first;
  String selectedCurrency = currencyList.first;
  String currencyValue = '';

  @override
  void initState() {
    super.initState();
  }

  getSpecificRate(assetIdBase, assetIdQuote) async {
    BiticonAPI biticonAPI = BiticonAPI();
    dynamic responseData =
        await biticonAPI.getSpecificRate(assetIdBase, assetIdQuote);
    setState(() {
      currencyValue = responseData['rate'].toStringAsFixed(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 $selectedCrypto=${currencyValue.isEmpty ? '?' : currencyValue} $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            color: Colors.lightBlue,
            child: Picker(
              onChange: (newValue) {
                print(newValue);
                setState(() {
                  selectedCurrency = newValue;
                });
                getSpecificRate(selectedCrypto, selectedCurrency);
              },
            ),
          ),
        ],
      ),
    );
  }
}
