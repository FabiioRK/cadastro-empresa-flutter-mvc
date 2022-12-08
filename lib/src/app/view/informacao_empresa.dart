import 'package:formulario/src/app/api/api.dart';
import 'package:formulario/src/app/model/currency.dart';
import 'package:formulario/src/app/view/currency_cadastrada.dart';
import 'package:formulario/src/model.dart';
import 'package:formulario/src/view.dart';
import 'package:formulario/src/controller.dart';

class InformacaoEmpresa extends StatefulWidget {
  final Empresa _empresa;

  const InformacaoEmpresa(this._empresa, {super.key});

  @override
  State<StatefulWidget> createState() {
    return InformacaoEmpresaState();
  }
}

class InformacaoEmpresaState extends State<InformacaoEmpresa> {
  List<Currency> _currency = [];

  Future getCurrency() async {
    List<Currency> listaCurrency = await Api().fetchCurrency("e33e73cc");
    print("entrou no getCurrency");
    setState(() {
      _currency = listaCurrency;
    });
  }

  @override
  void initState() {
    getCurrency();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_currency);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget._empresa.razaoSocial),
        ),
        body: Column(children: <Widget>[
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
                  child: Column(children: <Widget>[
                    InformacaoEmpresaController().possuiLogo(widget._empresa)
                        ? LogoEmpresa(widget._empresa.logoUrl!)
                        : LogoEmpresa("https://i.imgur.com/sdpbThM.jpg"),
                    InformacoesContato(
                        "${widget._empresa.razaoSocial} | ${widget._empresa.cnpj} | ${widget._empresa.valor} BRL"),
                  ]))),
          Expanded(
              child: ListView.builder(
            itemCount: _currency.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, indice) {
              final currency = _currency[indice];
              return CurrencyCadastrada(currency, widget._empresa.valor);
            },
          ))
        ]));
  }
}
