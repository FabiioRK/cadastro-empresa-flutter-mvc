import 'package:flutter/material.dart';
import '../model/empresa.dart';
import 'cadastro_empresa.dart';

class ListaEmpresa extends StatelessWidget {
  final List<Empresa> _empresas = [];

  @override
  Widget build(BuildContext context) {
    _empresas.add(Empresa("teste123", "99.999.999/0001-11"));
    _empresas.add(Empresa("Romão Corretora de Seguros", "28.423.067/0001-58",
        "https://i.imgur.com/I4yFbLW.jpg"));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empresas cadastradas"),
      ),
      body: _empresas.isNotEmpty
          ? ListView.builder(
              itemCount: _empresas.length,
              itemBuilder: (context, indice) {
                final empresa = _empresas[indice];
                return EmpresaCadastrada(empresa);
              },
            )
          : const Center(
              child: Text("Não há empresas cadastradas"),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioCadastro();
          }));
        },
      ),
    );
  }
}
