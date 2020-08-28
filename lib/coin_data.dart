import 'package:bitcoin_ticker/network.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'KRW',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '822FA268-98C2-4A54-BC11-EFE65581AF21';
const coinAPIURL = 'http://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCurrencyPrice(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String url = '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      NetworkHelper networkHelper = NetworkHelper(url);

      var decodedData = await networkHelper.getData();
      double lastPrice = decodedData['rate'];
      cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
    }
    return cryptoPrices;
  }
}
