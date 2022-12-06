import 'package:formulario/src/model.dart';
import 'package:formulario/src/view.dart';
import 'package:formulario/src/controller.dart';
import 'package:formulario/src/app/model/currency.dart';
import 'package:formulario/src/app/view/currency_cadastrada.dart';
import 'package:formulario/src/app/controller/currency_controller.dart';

class InformacaoEmpresa extends StatefulWidget {
  final Empresa _empresa;

  const InformacaoEmpresa(this._empresa, {super.key});

  @override
  State<StatefulWidget> createState() {
    return InformacaoEmpresaState();
  }
}

class InformacaoEmpresaState extends State<InformacaoEmpresa> {
  Future<List<CurrencyModel>> _currency =  RequestHelper().getCurrencies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._empresa.razaoSocial),
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
                  InformacaoEmpresaController().possuiLogo(widget._empresa)
                      ? LogoEmpresa(widget._empresa.logoUrl!)
                      : LogoEmpresa("https://i.imgur.com/sdpbThM.jpg"),
                  InformacoesContato(
                      "${widget._empresa.razaoSocial} | ${widget._empresa.cnpj} | ${widget._empresa.valor}"),
                  Expanded(
                    child: FutureBuilder(
                      future: _currency,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data,
                            itemBuilder: (context, indice) {
                              final currency = snapshot.data[indice];
                              return CurrencyCadastrada(currency);
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
