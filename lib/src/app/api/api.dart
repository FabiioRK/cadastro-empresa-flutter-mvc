import 'dart:convert';

import 'package:formulario/src/app/model/currency.dart';
import 'package:http/http.dart' as http;

class Api {
  const Api();

  final String apiKey = 'GWokmKwGWNVOYIlVhk540pdnYArZXPvQSDvp';

  Future<List<CurrencyModel>> fetchCurrency() async {
    final response = await http.get(Uri.parse(
        'https://currencyapi.net/api/v1/rates?key=${apiKey}&output=JSON'));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<CurrencyModel> currencies = [];
      for (var code in data["data"].keys) {
        CurrencyModel currency = CurrencyModel(
            code: data["data"][code]["code"],
            value: data["data"][code]["value"].toDouble());
        currencies.add(currency);
      }
      return currencies;
    } else {
      throw Exception('Failed');
    }
  }
}
