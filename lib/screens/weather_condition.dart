import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/screens/search_city.dart';
import 'package:weather/services/weather.dart';
import 'package:weather/utilities/utility.dart';

// ignore: constant_identifier_names
enum SunTime { SUNRISE, SUNSET }

/// 天气情况页面
class WeatherCondition extends StatefulWidget {
  const WeatherCondition({
    super.key,
    required this.weatherData,
  });

  final dynamic weatherData;

  @override
  State<WeatherCondition> createState() => _WeatherConditionState();
}

class _WeatherConditionState extends State<WeatherCondition> {
  String weekName = '';
  String timeNow = '';
  String cityName = ''; // 城市名称
  int temperature = 0; // 当前气温
  String weather = ''; // 当前天气
  String weatherDescription = ''; // 天气描述
  String sunriseTime = ''; // 日出时间
  String sunsetTime = ''; // 日落时间
  int windSpeed = 0; // 风速
  int humidity = 0; // 湿度
  String iconId = ''; // 图标id
  SunTime currentSunTime = SunTime.SUNRISE;

  @override
  void initState() {
    super.initState();

    updateUI(widget.weatherData);
  }

  updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData != null) {
        weekName = getWeekNameOfDay();
        timeNow = getFormattedCurrentTime(format: 'HH:mm a');

        cityName = weatherData['name'];
        temperature = weatherData['main']['temp'].toInt();
        weather = weatherData['weather'][0]['main'];
        weatherDescription = weatherData['weather'][0]['description'];
        sunsetTime = convertTimestampToFormatString(
            timestamp: weatherData['sys']['sunset'],
            format: 'HH:mm',
            timezone: weatherData['timezone']);
        sunriseTime = convertTimestampToFormatString(
            timestamp: weatherData['sys']['sunrise'],
            format: 'HH:mm',
            timezone: weatherData['timezone']);
        windSpeed = weatherData['wind']['speed'].toInt();
        humidity = weatherData['main']['humidity'];
        iconId = weatherData['weather'][0]['icon'];
        currentSunTime = SunTime.SUNRISE;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () async {
                    WeatherAPI weatherAPI = WeatherAPI();
                    dynamic responseData =
                        await weatherAPI.getWeatherByLocation();
                    updateUI(responseData);
                  },
                  icon: const Icon(Icons.near_me),
                ),
                IconButton(
                  onPressed: () async {
                    var cityName = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SearchCity();
                        },
                      ),
                    );

                    WeatherAPI weatherAPI = WeatherAPI();
                    dynamic responseData =
                        await weatherAPI.getWeatherByCity(cityName);
                    updateUI(responseData);
                  },
                  icon: const Icon(Icons.location_city),
                ),
              ],
            ),
            Text(
              cityName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weekName,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  timeNow,
                ),
              ],
            ),
            Image(
              image: NetworkImage(
                  'https://openweathermap.org/img/wn/$iconId@2x.png'),
              height: 200.00,
            ),
            Text(
              '$temperature℃',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              weather,
            ),
            Text(
              weatherDescription,
            ),
            const SizedBox(
              width: 30.0,
              height: 20.0,
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      currentSunTime = currentSunTime == SunTime.SUNRISE
                          ? SunTime.SUNSET
                          : SunTime.SUNRISE;
                    });
                  },
                  child: WeatherItem(
                      icon: Icons.sunny,
                      title: currentSunTime == SunTime.SUNRISE
                          ? 'SUNRISE'
                          : 'SUNSET',
                      data: currentSunTime == SunTime.SUNRISE
                          ? sunriseTime
                          : sunsetTime),
                ),
                const WeatherVerticalDivider(),
                WeatherItem(
                    icon: Icons.wind_power_outlined,
                    title: 'WIND',
                    data: '$windSpeed  m/s'),
                const SizedBox(
                  height: 40.0,
                  child: VerticalDivider(),
                ),
                WeatherItem(
                    icon: Icons.water_drop_outlined,
                    title: 'HUMIDITY',
                    data: '$humidity %'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherVerticalDivider extends StatelessWidget {
  const WeatherVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 40.0,
      child: VerticalDivider(
        thickness: 2.0,
      ),
    );
  }
}

class WeatherItem extends StatelessWidget {
  const WeatherItem({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(title),
        Text(
          data,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}
