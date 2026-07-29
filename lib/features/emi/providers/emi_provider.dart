import 'package:flutter/material.dart';

import '../model/emi_result.dart';
import '../utils/emi_calculator.dart';

import '../../history/service/history_service.dart';

class EmiProvider extends ChangeNotifier {
  final amountController = TextEditingController();

  final rateController = TextEditingController();

  final tenureController = TextEditingController();

  bool isYear = true;

  EmiResult? result;

  void changeTenureType(bool value) {
    isYear = value;

    result = null;

    notifyListeners();
  }

  void calculate() {
    double amount = double.tryParse(amountController.text) ?? 0;

    double rate = double.tryParse(rateController.text) ?? 0;

    int tenure = int.tryParse(tenureController.text) ?? 0;

    if (isYear) {
      tenure = tenure * 12;
    }

    result = EmiCalculator.calculate(
      principal: amount,
      annualRate: rate,
      tenureMonths: tenure,
    );

    HistoryService.save(
      tool: "EMI",
      input:
          "₹${amount.toStringAsFixed(2)} | ${rate.toStringAsFixed(2)}% | $tenure Months",
      output: "EMI ₹${result!.monthlyEmi.toStringAsFixed(2)}",
    );

    notifyListeners();
  }

  void reset() {
    amountController.clear();
    rateController.clear();
    tenureController.clear();

    result = null;

    notifyListeners();
  }
}
