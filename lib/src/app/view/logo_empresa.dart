import 'package:flutter/material.dart';

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