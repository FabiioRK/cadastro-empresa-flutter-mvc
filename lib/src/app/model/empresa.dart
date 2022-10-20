class Empresa {
  final String razaoSocial;
  final String cnpj;
  final String? logoUrl;

  Empresa(this.razaoSocial, this.cnpj, [this.logoUrl]);

  @override
  String toString() {
    return 'Empresa{razaoSocial: $razaoSocial, cnpj: $cnpj, logoUrl: $logoUrl}';
  }
}