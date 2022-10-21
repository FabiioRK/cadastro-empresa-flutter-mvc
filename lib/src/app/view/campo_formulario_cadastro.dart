import 'package:formulario/src/view.dart';
import 'package:formulario/src/model.dart';
import 'package:formulario/src/controller.dart';

class CampoFormularioCadastro extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar empresa"),
      ),
      body: Column(
        children: <Widget>[
          EditorCampoCadastro(
            controlador: FormularioCadastro().controladorCampoRazaoSocial,
            rotulo: "Razão Social",
            dica: "João da Silva LTDA",
          ),
          EditorCampoCadastro(
            controlador: FormularioCadastro().controladorCampoCnpj,
            rotulo: "CNPJ",
            dica: "12.345.678/0001-99",
          ),
          EditorCampoCadastro(
            controlador: FormularioCadastro().controladorCampoLogoUrl,
            rotulo: "Logo da Empresa",
            dica: "URL da imagem",
          ),
          ElevatedButton(
            onPressed: () => CadastroEmpresaController().criaEmpresa(context),
            child: const Text("Confirmar"),
          )
        ],
      ),
    );
  }

}