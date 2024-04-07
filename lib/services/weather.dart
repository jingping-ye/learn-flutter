import 'package:weather/services/location.dart';
import 'package:weather/services/network.dart';

// ignore: constant_identifier_names
const String BaseURL = 'api.openweathermap.org';
// ignore: constant_identifier_names
const String APPID = '13676fb89eb63ffd6ae0fb369d8207c2';

class WeatherAPI {
  _getLocation() async {
    Location location = Location();
    var responseData = await location.getCurrentLocation();
    return responseData;
  }

  /// 将获取地理位置和获取天气状况二合一
  getWeatherByLocation() async {
    var locationData = await _getLocation();
    double longitude = locationData['longitude'];
    double latitude = locationData['latitude'];

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$APPID&units=metric');
    var responseData = await networkHelper.getData();
    return responseData;
  }

  getWeatherByCity(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$APPID&units=metric');
    var responseData = await networkHelper.getData();
    return responseData;
  }
}
