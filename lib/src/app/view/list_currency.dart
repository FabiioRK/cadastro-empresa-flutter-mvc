import 'package:flutter/material.dart';
import 'package:formulario/src/app/model/currency.dart';
import 'package:formulario/src/app/view/currency_cadastrada.dart';

class ListCurrency extends StatefulWidget {
  ListCurrency({super.key});

  final List<CurrencyModel> _currency = [];

  @override
  State<StatefulWidget> createState() {
    return ListCurrencyState();
  }
}

class ListCurrencyState extends State<ListCurrency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empresas cadastradas"),
      ),
      body: widget._currency.isNotEmpty
          ? ListView.builder(
              itemCount: widget._currency.length,
              itemBuilder: (context, indice) {
                final currency = widget._currency[indice];
                return CurrencyCadastrada(currency);
              },
            )
          : const Center(
              child: Text("Não há valores cadastrados."),
            ),
    );
  }
}
