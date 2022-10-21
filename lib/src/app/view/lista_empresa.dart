import 'package:formulario/src/model.dart';
import 'package:formulario/src/view.dart';
import 'package:formulario/src/controller.dart';

class ListaEmpresa extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ListaEmpresaController.empresas.add(Empresa("teste123", "99.999.999/0001-11"));
    ListaEmpresaController.empresas.add(Empresa("Romão Corretora de Seguros", "28.423.067/0001-58",
        "https://i.imgur.com/I4yFbLW.jpg"));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Empresas cadastradas"),
      ),
      body: ListaEmpresaController.empresas.isNotEmpty
          ? ListView.builder(
              itemCount: ListaEmpresaController.empresas.length,
              itemBuilder: (context, indice) {
                final empresa = ListaEmpresaController.empresas[indice];
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
            return CampoFormularioCadastro();
          }));
        },
      ),
    );
  }
}
