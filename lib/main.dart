import 'package:bitcoin_ticker/screen/price_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Price Screen',
      // theme: ThemeData(
      //   primaryColor: Colors.lightBlue,
      //   scaffoldBackgroundColor: Colors.white,
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      //   useMaterial3: true,
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: Colors.lightBlue,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
      home: const PriceScreen(),
    );
  }
}
