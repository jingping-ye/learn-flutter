import 'package:geolocator/geolocator.dart';

class Location {
  getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      double latitude = position.latitude;
      double longitude = position.longitude;
      return <String, double>{'latitude': latitude, 'longitude': longitude};
    } catch (e) {
      print('e:$e');
    }
  }
}
