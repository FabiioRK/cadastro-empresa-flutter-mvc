import 'package:formulario/src/controller.dart';
import 'package:formulario/src/model.dart';

class EmpresaCadastrada extends StatelessWidget {

  final Empresa _empresa;

  const EmpresaCadastrada(this._empresa, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: const Icon(Icons.contact_page_sharp),
        title: Text(_empresa.razaoSocial),
        subtitle: Text(_empresa.cnpj),
      ),
      onTap: () => InformacaoEmpresaController().infoEmpresa(_empresa, context),
    );
  }
}

