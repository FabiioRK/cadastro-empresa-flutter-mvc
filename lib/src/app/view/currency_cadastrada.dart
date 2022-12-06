import 'package:formulario/src/app/model/currency.dart';
import 'package:formulario/src/controller.dart';
import 'package:formulario/src/model.dart';

class CurrencyCadastrada extends StatelessWidget {
  final CurrencyModel _currency;

  const CurrencyCadastrada(this._currency, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        title: Text("${_currency.code}"),
        subtitle: Text("${_currency.value}"),
      ),
    );
  }
}
