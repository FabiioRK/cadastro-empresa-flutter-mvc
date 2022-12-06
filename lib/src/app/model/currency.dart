class CurrencyModel {
  final String? code;
  final double? value;

  CurrencyModel({this.code, this.value});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
      code: json['code'],
      value: json['value'],
    );
  }
