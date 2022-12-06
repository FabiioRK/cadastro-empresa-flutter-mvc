import 'package:formulario/src/model.dart';
import 'package:formulario/src/view.dart';
import 'package:formulario/src/controller.dart';
import 'package:formulario/src/app/model/currency.dart';
import 'package:formulario/src/app/view/currency_cadastrada.dart';
import 'package:formulario/src/app/controller/currency_controller.dart';

class InformacaoEmpresa extends StatelessWidget {
  final Empresa _empresa;
  Future<List<CurrencyModel>> _currency = RequestHelper().getCurrencies();

  InformacaoEmpresa(this._empresa);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_empresa.razaoSocial),
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Color.fromRGBO(0, 0, 51, 50)],
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 250.0,
              child: Column(
                children: <Widget>[
                  InformacaoEmpresaController().possuiLogo(_empresa)
                      ? LogoEmpresa(_empresa.logoUrl!)
                      : LogoEmpresa("https://i.imgur.com/sdpbThM.jpg"),
                  InformacoesContato(
                      "${_empresa.razaoSocial} | ${_empresa.cnpj} | ${_empresa.valor}"),
                  ListView.builder(
                    itemCount: _currency.length,
                    itemBuilder: (context, indice) {
                      final currency = _currency[indice];
                      return CurrencyCadastrada(currency);
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
