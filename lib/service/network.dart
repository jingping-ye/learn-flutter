import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  getData({required String url, Map<String, String>? headers}) async {
    Uri innerUrl = Uri.parse(url);
    http.Response response = await http.get(innerUrl, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('status code: ${response.statusCode}');
    }
  }
}
