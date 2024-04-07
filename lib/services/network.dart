import 'package:http/http.dart' as http;
import 'dart:convert';

///统一处理网络请求
class NetworkHelper {
  NetworkHelper({required this.url});
  final String url;

  getData() async {
    Uri innerUrl = Uri.parse(url);
    http.Response response = await http.get(innerUrl);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print('status code: ${response.statusCode}');
    }
  }
}
