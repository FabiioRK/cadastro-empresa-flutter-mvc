import 'package:formulario/src/model.dart';
import 'package:formulario/src/view.dart';

class ListaEmpresa extends StatefulWidget {
  ListaEmpresa({super.key});

  final List<Empresa> _empresas = [];

  @override
  State<StatefulWidget> createState() {
    return ListaEmpresaState();
  }
}

class ListaEmpresaState extends State<ListaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empresas cadastradas"),
      ),
      body: widget._empresas.isNotEmpty
          ? ListView.builder(
              itemCount: widget._empresas.length,
              itemBuilder: (context, indice) {
                final empresa = widget._empresas[indice];
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
            return const CampoFormularioCadastro();
          })).then((empresaRecebida) => atualizaEmpresa(empresaRecebida));
        },
      ),
    );
  }

  void atualizaEmpresa(Empresa? empresaRecebida) {
    if (empresaRecebida != null) {
      setState(() {
        widget._empresas.add(empresaRecebida);
      });
    }
  }
}
