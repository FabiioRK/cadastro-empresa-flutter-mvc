import 'package:formulario/src/model.dart';
import 'package:formulario/src/view.dart';

class CadastroEmpresaController {
  void criaEmpresa(
      TextEditingController controladorCampoRazaoSocial,
      TextEditingController controladorCampoCnpj,
      TextEditingController controladorCampoValor,
      TextEditingController controladorCampoLogoUrl,
      BuildContext context) {
    final String razaoSocial = controladorCampoRazaoSocial.text;
    final String cnpj = controladorCampoCnpj.text;
    final double valor = double.parse(controladorCampoValor.text);
    final String logoUrl = controladorCampoLogoUrl.text;

    if (razaoSocial.isNotEmpty && cnpj.isNotEmpty) {
      final empresaCriada = Empresa(razaoSocial, cnpj, valor, logoUrl);
      Navigator.pop(context, empresaCriada);
    }
  }
}
