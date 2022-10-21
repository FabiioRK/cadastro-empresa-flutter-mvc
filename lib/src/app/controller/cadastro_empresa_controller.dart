import 'package:flutter/material.dart';
import 'package:formulario/src/app/model/formulario_cadastro.dart';
import 'package:formulario/src/app/model/empresa.dart';

class CadastroEmpresaController {
  void criaEmpresa(BuildContext context) {
    final String razaoSocial = FormularioCadastro().controladorCampoRazaoSocial.text;
    final String cnpj = FormularioCadastro().controladorCampoCnpj.text;
    final String logoUrl = FormularioCadastro().controladorCampoLogoUrl.text;

    if (razaoSocial.isNotEmpty && cnpj.isNotEmpty) {
      final empresaCriada = Empresa(razaoSocial, cnpj, logoUrl);
      Navigator.pop(context, empresaCriada);
    }
  }


}