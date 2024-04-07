import 'package:flutter/material.dart';
import 'package:weather/screens/weather_condition.dart';
import 'package:weather/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// 开屏加载
class ScreenLoading extends StatefulWidget {
  const ScreenLoading({super.key});

  @override
  State<ScreenLoading> createState() => _ScreenLoadingState();
}

class _ScreenLoadingState extends State<ScreenLoading> {
  @override
  void initState() {
    // int timestamp = 1712381017;

    super.initState();
    getLocation();
  }

  void getLocation() async {
    WeatherAPI weatherAPI = WeatherAPI();
    dynamic responseBody = await weatherAPI.getWeatherByLocation();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return WeatherCondition(weatherData: responseBody);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      ),
    );
  }
}
