import 'package:formulario/src/model.dart';
import 'package:formulario/src/view.dart';


class InfoEmpresaController {

  void infoEmpresa(Empresa empresa, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return InformacaoEmpresa(empresa);
    }));
  }

  bool possuiLogo(Empresa empresa) {
    try {
      if (empresa.logoUrl!.isNotEmpty) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}