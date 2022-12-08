import 'package:formulario/src/view.dart';
import 'package:formulario/src/controller.dart';

class CampoFormularioCadastro extends StatefulWidget {
  const CampoFormularioCadastro({super.key});

  @override
  State<StatefulWidget> createState() {
    return CampoFormularioCadastroState();
  }
}

class CampoFormularioCadastroState extends State<CampoFormularioCadastro> {
  final TextEditingController _controladorCampoRazaoSocial =
      TextEditingController();
  final TextEditingController _controladorCampoCnpj = TextEditingController();
  final TextEditingController _controladorCampoValue = TextEditingController();
  final TextEditingController _controladorCampoLogoUrl =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
              Text(
                'Cadastrar empresa ',
                style: TextStyle(
                  fontFamily: 'OpenSansBold',
                  fontSize: 26.0,
                ),
              ),
              Icon(
                Icons.add_business_rounded,
                color: Colors.blue,
                size: 30.0,
              ),
            ])),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              EditorCampoCadastro(
                controlador: _controladorCampoRazaoSocial,
                rotulo: "Razão Social",
                dica: "João da Silva LTDA",
              ),
              EditorCampoCadastro(
                controlador: _controladorCampoCnpj,
                rotulo: "CNPJ",
                dica: "12.345.678/0001-99",
              ),
              EditorCampoCadastro(
                controlador: _controladorCampoValue,
                rotulo: "Valor de ação em real",
                dica: "39.47",
              ),
              EditorCampoCadastro(
                controlador: _controladorCampoLogoUrl,
                rotulo: "Logo da Empresa",
                dica: "URL da imagem",
              ),
              ElevatedButton(
                onPressed: () => CadastroEmpresaController().criaEmpresa(
                    _controladorCampoRazaoSocial,
                    _controladorCampoCnpj,
                    _controladorCampoValue,
                    _controladorCampoLogoUrl,
                    context),
                child: const Text("Confirmar"),
              )
            ],
          ),
        ));
  }
}
