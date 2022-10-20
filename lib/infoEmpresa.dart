import 'package:flutter/material.dart';
import 'cadastroEmpresa.dart';

class InformacaoEmpresa extends StatelessWidget {
  final Empresa _empresa;

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
                  _possuiLogo()
                      ? LogoEmpresa(_empresa.logoUrl!)
                      : LogoEmpresa("https://i.imgur.com/sdpbThM.jpg"),
                  InformacoesContato(_empresa.razaoSocial),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _possuiLogo() {
    try {
      if (_empresa.logoUrl!.isNotEmpty) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}

class LogoEmpresa extends StatelessWidget {
  final String _url;

  LogoEmpresa(this._url);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 100.00,
          height: 100.00,
          margin: const EdgeInsets.fromLTRB(8.0, 16.0, 16.0, 64.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(_url),
            ),
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(60, 0, 0, 0),
                blurRadius: 5.0,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class InformacoesContato extends StatelessWidget {
  final String _razaoSocial;

  InformacoesContato(this._razaoSocial);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 0.0),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    _razaoSocial,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
