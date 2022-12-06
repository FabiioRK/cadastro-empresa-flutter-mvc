import 'dart:convert';

import 'package:formulario/src/app/model/currency.dart';
import 'package:http/http.dart' as http;

class Api {
  const Api();

  final String apiKey = 'GWokmKwGWNVOYIlVhk540pdnYArZXPvQSDvp';

  Future<List<CurrencyModel>> fetchCurrency() async {
    final response = await http.get(Uri.parse(
        'https://currencyapi.net/api/v1/rates?key=${apiKey}&output=JSON'));
    var data = jsonDecode(response.body)['rates'];

    if (response.statusCode == 200) {
      print(data);

      Future<List<CurrencyModel>> listCurrency = data
      .map((data) => CurrencyModel.fromJson(data))
      .toList();

      print(listCurrency);

      return listCurrency;
    } else {
      throw Exception('Failed');
    }
  }
}
