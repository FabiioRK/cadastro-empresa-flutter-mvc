import 'dart:convert';

import 'package:formulario/src/app/model/currency.dart';
import 'package:http/http.dart' as http;

class Api {
  const Api();

  Future<List<Currency>> fetchCurrency(String apiKey) async {
    final response = await http
        .get(Uri.parse('https://api.hgbrasil.com/finance?key=${apiKey}'));

    // Usar esse método não deu certo!
    // var data = jsonDecode(response.body)['results']['currencies'];
    // Future<List<Currency>> listCurrency = data
    // .map((data) => Currency.fromJson(data))
    // .toList();

    List<Currency> listCurrency = [];

    var map = jsonDecode(response.body)['results']['currencies']['USD'];
    Currency currency = Currency.fromJson(map);
    print(currency);
    listCurrency.add(currency);

    map = jsonDecode(response.body)['results']['currencies']['EUR'];
    currency = Currency.fromJson(map);
    print(currency);
    listCurrency.add(currency);

    map = jsonDecode(response.body)['results']['currencies']['GBP'];
    currency = Currency.fromJson(map);
    print(currency);
    listCurrency.add(currency);

    map = jsonDecode(response.body)['results']['currencies']['ARS'];
    currency = Currency.fromJson(map);
    print(currency);
    listCurrency.add(currency);

    map = jsonDecode(response.body)['results']['currencies']['CAD'];
    currency = Currency.fromJson(map);
    print(currency);
    listCurrency.add(currency);

    map = jsonDecode(response.body)['results']['currencies']['AUD'];
    currency = Currency.fromJson(map);
    print(currency);
    listCurrency.add(currency);

    map = jsonDecode(response.body)['results']['currencies']['JPY'];
    currency = Currency.fromJson(map);
    print(currency);
    listCurrency.add(currency);

    map = jsonDecode(response.body)['results']['currencies']['CNY'];
    currency = Currency.fromJson(map);
    print(currency);
    listCurrency.add(currency);

    map = jsonDecode(response.body)['results']['currencies']['BTC'];
    currency = Currency.fromJson(map);
    print(currency);
    listCurrency.add(currency);

    return listCurrency;
  }
}
