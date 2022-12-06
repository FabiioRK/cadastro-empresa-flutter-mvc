import 'package:flutter/material.dart';

class InformacoesContato extends StatelessWidget {
  final String _texto;

  InformacoesContato(this._texto);

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
                    _texto,
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
