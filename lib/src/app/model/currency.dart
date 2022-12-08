class Currency {
  String? name;
  double? buy;

  Currency({var this.name, var this.buy});

  factory Currency.fromJson(Map<String, dynamic> json) =>
      Currency(name: json['name'], buy: json['buy']);

  @override
  String toString() {
    return 'Currency{name: $name, buy: $buy}';
  }
}
