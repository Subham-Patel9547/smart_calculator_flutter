import 'package:flutter/material.dart';

import '../models/loan_result.dart';
import '../utils/loan_calculator.dart';

import '../../history/service/history_service.dart';

class LoanProvider extends ChangeNotifier {
  final amountController = TextEditingController();
  final interestController = TextEditingController();
  final durationController = TextEditingController();

  LoanResult? result;
  String? error;

  void calculateLoan() {
    double? amount = double.tryParse(amountController.text);
    double? interest = double.tryParse(interestController.text);

    int? years = int.tryParse(durationController.text);

    if (amount == null || interest == null || years == null) {
      error = "Please enter valid values";
      notifyListeners();
      return;
    }

    result = LoanCalculator.calculate(
      principal: amount,
      annualRate: interest,
      years: years,
    );

    error = null;

    HistoryService.save(
      tool: "Loan",
      input: "₹$amount | $interest% | $years Years",
      output: "EMI ₹${result!.monthlyEmi.toStringAsFixed(2)}",
    );

    notifyListeners();
  }

  @override
  void dispose() {
    amountController.dispose();
    interestController.dispose();
    durationController.dispose();

    super.dispose();
  }
}
