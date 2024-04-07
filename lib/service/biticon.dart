import 'package:bitcoin_ticker/service/network.dart';

const String APPID = '330C441D-2BA9-4596-8A74-5CF235623B7D';

class BiticonAPI {
  getSpecificRate(String assetIdBase, String assetIdQuote) async {
    NetworkHelper networkHelper = NetworkHelper();
    String url =
        'https://rest.coinapi.io/v1/exchangerate/$assetIdBase/$assetIdQuote';
    Map<String, String> headers = {'X-CoinAPI-Key': APPID};
    dynamic responseData =
        await networkHelper.getData(url: url, headers: headers);
    return responseData;
  }
}
