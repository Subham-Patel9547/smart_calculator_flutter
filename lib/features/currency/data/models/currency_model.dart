class CurrencyModel {
  final String code;
  final String name;
  final String countryCode;

  const CurrencyModel({
    required this.code,
    required this.name,
    required this.countryCode,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      code: json['code'],
      name: json['name'],
      countryCode: json['countryCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'countryCode': countryCode,
    };
  }

  @override
  String toString() => "$code - $name";
}