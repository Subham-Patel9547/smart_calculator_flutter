class ExchangeRateModel {
  final String from;
  final String to;
  final double rate;

  const ExchangeRateModel({
    required this.from,
    required this.to,
    required this.rate,
  });

  factory ExchangeRateModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ExchangeRateModel(
      from: json['base_code'],
      to: json['target_code'],
      rate: (json['conversion_rate'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'base_code': from,
      'target_code': to,
      'conversion_rate': rate,
    };
  }
}