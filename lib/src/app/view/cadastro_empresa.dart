import 'package:flutter/material.dart';
import '../model/empresa.dart';
import 'info_empresa.dart';



class EmpresaCadastrada extends StatelessWidget {
  final Empresa _empresa;

  EmpresaCadastrada(this._empresa);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ListTile(
        leading: const Icon(Icons.contact_page_sharp),
        title: Text(_empresa.razaoSocial),
        subtitle: Text(_empresa.cnpj),
      ),
      onTap: () => _infoEmpresa(context),
    );
  }

  void _infoEmpresa(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return InformacaoEmpresa(_empresa);
    }));
  }
}

class FormularioCadastro extends StatelessWidget {
  final TextEditingController _controladorCampoRazaoSocial =
      TextEditingController();
  final TextEditingController _controladorCampoCnpj = TextEditingController();
  final TextEditingController _controladorCampoLogoUrl =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar empresa"),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controlador: _controladorCampoRazaoSocial,
            rotulo: "Razão Social",
            dica: "João da Silva LTDA",
          ),
          Editor(
            controlador: _controladorCampoCnpj,
            rotulo: "CNPJ",
            dica: "12.345.678/0001-99",
          ),
          Editor(
            controlador: _controladorCampoLogoUrl,
            rotulo: "Logo da Empresa",
            dica: "URL da imagem",
          ),
          ElevatedButton(
            onPressed: () => _criaEmpresa(context),
            child: const Text("Confirmar"),
          )
        ],
      ),
    );
  }

  void _criaEmpresa(BuildContext context) {
    final String razaoSocial = _controladorCampoRazaoSocial.text;
    final String cnpj = _controladorCampoCnpj.text;
    final String logoUrl = _controladorCampoLogoUrl.text;

    if (razaoSocial.isNotEmpty && cnpj.isNotEmpty) {
      final empresaCriada = Empresa(razaoSocial, cnpj, logoUrl);
      debugPrint("Criando empresa");
      debugPrint("$empresaCriada");
      Navigator.pop(context, empresaCriada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: const TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
      ),
    );
  }
}
