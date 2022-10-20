import 'package:flutter/material.dart';
import 'listaEmpresa.dart';

import 'cadastroEmpresa.dart';

void main() => runApp(CFContabilApp());

class CFContabilApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaEmpresa(),
      ),
    );
  }
}



