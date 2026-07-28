import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../model/gst_result.dart';
import '../utils/gst_calculator.dart';

class GstProvider extends ChangeNotifier {
  /// Controllers
  final TextEditingController amountController = TextEditingController();

  final TextEditingController rateController = TextEditingController();

  /// Formatter
  final NumberFormat _currency = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 2,
  );

  /// GST Rates
  final List<double> gstRates = [3, 5, 12, 18, 28];

  /// State
  double _selectedRate = 18;

  bool _includeGst = false;

  GstResult? _result;

  String? _errorText;

  /// Getters

  double get selectedRate => _selectedRate;

  bool get includeGst => _includeGst;

  GstResult? get result => _result;

  String? get errorText => _errorText;

  /// Select GST Rate

  void selectRate(double rate) {
    _selectedRate = rate;

    rateController.text = rate.toString();

    notifyListeners();
  }

  /// Custom GST Rate

  void onCustomRateChanged(String value) {
    final rate = double.tryParse(value);

    if (rate != null && rate > 0 && rate <= 100) {
      _selectedRate = rate;
      notifyListeners();
    }
  }

  /// Include / Exclude

  void changeMode(bool value) {
    _includeGst = value;
    notifyListeners();
  }

  /// Validation

  bool validate() {
    _errorText = null;

    if (amountController.text.trim().isEmpty) {
      _errorText = "Please enter amount";
      notifyListeners();
      return false;
    }

    final amount = double.tryParse(amountController.text.trim());

    if (amount == null) {
      _errorText = "Invalid amount";
      notifyListeners();
      return false;
    }

    if (amount <= 0) {
      _errorText = "Amount must be greater than 0";
      notifyListeners();
      return false;
    }

    if (_selectedRate <= 0 || _selectedRate > 100) {
      _errorText = "Invalid GST rate";
      notifyListeners();
      return false;
    }

    return true;
  }

  /// Calculate GST

  void calculate() {
    if (!validate()) return;

    final amount = double.parse(amountController.text.trim());

    _result = GstCalculator.calculate(
      amount: amount,
      rate: _selectedRate,
      includeGst: _includeGst,
    );

    notifyListeners();
  }

  /// Reset

  void reset() {
    amountController.clear();

    rateController.clear();

    _selectedRate = 18;

    _includeGst = false;

    _result = null;

    _errorText = null;

    notifyListeners();
  }

  /// Currency Format

  String formatCurrency(double value) {
    return _currency.format(value);
  }

  /// Copy Text

  String get shareText {
    if (_result == null) return "";

    return '''
GST Calculator

Amount : ${formatCurrency(_result!.amount)}

GST Rate : ${_result!.gstRate}%

Mode : ${_includeGst ? "Include GST" : "Exclude GST"}

Original Amount : ${formatCurrency(_result!.originalAmount)}

GST Amount : ${formatCurrency(_result!.gstAmount)}

Total Amount : ${formatCurrency(_result!.totalAmount)}
''';
  }

  /// Copy Result

  Future<void> copyResult(BuildContext context) async {
    if (_result == null) return;

    await Clipboard.setData(ClipboardData(text: shareText));

    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Result copied")));
    }
  }

  /// Clear Error

  void clearError() {
    if (_errorText != null) {
      _errorText = null;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    amountController.dispose();
    rateController.dispose();
    super.dispose();
  }
}
