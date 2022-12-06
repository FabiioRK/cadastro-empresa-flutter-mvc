class Empresa {
  final String razaoSocial;
  final String cnpj;
  final double? valor;
  final String? logoUrl;

  Empresa(this.razaoSocial, this.cnpj, this.valor, [this.logoUrl]);

  @override
  String toString() {
    return 'Empresa{razaoSocial: $razaoSocial, cnpj: $cnpj, valor: $valor, logoUrl: $logoUrl}';
  }
}
