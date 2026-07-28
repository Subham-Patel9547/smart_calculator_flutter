class GstResult {
  final double amount;
  final double gstRate;
  final bool includeGst;

  final double originalAmount;
  final double gstAmount;
  final double totalAmount;

  const GstResult({
    required this.amount,
    required this.gstRate,
    required this.includeGst,
    required this.originalAmount,
    required this.gstAmount,
    required this.totalAmount,
  });

  GstResult copyWith({
    double? amount,
    double? gstRate,
    bool? includeGst,
    double? originalAmount,
    double? gstAmount,
    double? totalAmount,
  }) {
    return GstResult(
      amount: amount ?? this.amount,
      gstRate: gstRate ?? this.gstRate,
      includeGst: includeGst ?? this.includeGst,
      originalAmount: originalAmount ?? this.originalAmount,
      gstAmount: gstAmount ?? this.gstAmount,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "amount": amount,
      "gstRate": gstRate,
      "includeGst": includeGst,
      "originalAmount": originalAmount,
      "gstAmount": gstAmount,
      "totalAmount": totalAmount,
    };
  }

  factory GstResult.fromJson(Map<String, dynamic> json) {
    return GstResult(
      amount: (json["amount"] ?? 0).toDouble(),
      gstRate: (json["gstRate"] ?? 0).toDouble(),
      includeGst: json["includeGst"] ?? false,
      originalAmount: (json["originalAmount"] ?? 0).toDouble(),
      gstAmount: (json["gstAmount"] ?? 0).toDouble(),
      totalAmount: (json["totalAmount"] ?? 0).toDouble(),
    );
  }
}