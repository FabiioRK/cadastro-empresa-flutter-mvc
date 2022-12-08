// ignore_for_file: unnecessary_new

import 'package:formulario/src/app/model/currency.dart';
import 'package:formulario/src/controller.dart';
import 'package:formulario/src/model.dart';

class CurrencyCadastrada extends StatelessWidget {
  final Currency _currency;
  final double? empresaValor;

  const CurrencyCadastrada(this._currency, this.empresaValor, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: new Center(
            child: Text(
          "${_currency.name}",
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
        )),
        subtitle:
            new Center(child: Text("${(empresaValor! / _currency.buy!)}")),
      ),
    );
  }
}
