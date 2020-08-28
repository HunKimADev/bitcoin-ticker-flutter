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
const coinApiURL = 'http://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCurrencyPrice({String crypto, String currency}) async {
    var url = '$coinApiURL/$crypto/$currency?apikey=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);

    var priceData = await networkHelper.getData();
    return priceData['rate'];
  }
}
