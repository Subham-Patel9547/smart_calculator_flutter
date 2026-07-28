import '../model/gst_result.dart';

class GstCalculator {
  const GstCalculator._();

  static GstResult calculate({
    required double amount,
    required double rate,
    required bool includeGst,
  }) {
    if (includeGst) {
      final original = amount / (1 + rate / 100);
      final gst = amount - original;

      return GstResult(
        amount: amount,
        gstRate: rate,
        includeGst: true,
        originalAmount: original,
        gstAmount: gst,
        totalAmount: amount,
      );
    } else {
      final gst = amount * rate / 100;
      final total = amount + gst;

      return GstResult(
        amount: amount,
        gstRate: rate,
        includeGst: false,
        originalAmount: amount,
        gstAmount: gst,
        totalAmount: total,
      );
    }
  }
}