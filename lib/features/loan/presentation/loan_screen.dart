import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../app/theme/app_colors.dart';
import '../models/loan_result.dart';
import '../widgets/loan_result_card.dart';

class LoanScreen extends StatefulWidget {
  const LoanScreen({super.key});

  @override
  State<LoanScreen> createState() => _LoanScreenState();
}

class _LoanScreenState extends State<LoanScreen> {
  final TextEditingController loanController = TextEditingController();

  final TextEditingController interestController = TextEditingController();

  final TextEditingController yearController = TextEditingController();

  final TextEditingController monthController = TextEditingController();

  final NumberFormat formatter = NumberFormat.currency(
    locale: 'en_IN',
    symbol: '₹',
    decimalDigits: 0,
  );

  LoanResult? result;

  @override
  void initState() {
    super.initState();

    loanController.addListener(_calculateLoan);
    interestController.addListener(_calculateLoan);
    yearController.addListener(_calculateLoan);
    monthController.addListener(_calculateLoan);
  }

  void _calculateLoan() {

    final principal = double.tryParse(loanController.text) ?? 0;

    final annualRate = double.tryParse(interestController.text) ?? 0;

    final years = int.tryParse(yearController.text) ?? 0;

    final months = int.tryParse(monthController.text) ?? 0;

    final totalMonths = years * 12 + months;

    if (principal <= 0 || totalMonths <= 0) {
      setState(() {
        result = null;
      });
      return;
    }

    double interestPercentage = 0;

if (principal > 0) {
  interestPercentage = (totalInterest / principal) * 100;
}

    double monthlyRate = annualRate / 12 / 100;

    double emi;

    if (monthlyRate == 0) {
      emi = principal / totalMonths;
    } else {
      final factor = pow(1 + monthlyRate, totalMonths).toDouble();

      emi = (principal * monthlyRate * factor) / (factor - 1);
    }

    final totalPayment = emi * totalMonths;

    final totalInterest = totalPayment - principal;

    setState(() {
      double interestPercentage = 0;

      if (principal > 0) {
        interestPercentage = (totalInterest / principal) * 100;
      }

      result = LoanResult(
        monthlyEmi: emi,
        totalInterest: totalInterest,
        totalPayment: totalPayment,
        interestPercentage: interestPercentage,
      );
    });
  }

  @override
  void dispose() {
    loanController.dispose();
    interestController.dispose();
    yearController.dispose();
    monthController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Loan Calculator",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.appBar,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.appBar),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title("Loan Amount"),

              _field(controller: loanController, suffix: "₹"),

              const SizedBox(height: 20),

              _title("Interest Rate"),

              _field(controller: interestController, suffix: "%"),

              const SizedBox(height: 20),

              _title("Loan Tenure"),

              Row(
                children: [
                  Expanded(
                    child: _field(controller: yearController, suffix: "Yr"),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: _field(controller: monthController, suffix: "Mon"),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: _calculateLoan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff4CAF50),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    "Calculate Loan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              if (result != null) LoanResultCard(result: result!),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white70,
        ),
      ),
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String suffix,
  }) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xff1D1D1D),

        hintText: "",

        suffixIcon: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            suffix,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),

        suffixIconConstraints: const BoxConstraints(minWidth: 55),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.white.withOpacity(.05)),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Color(0xff4CAF50), width: 1.4),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
      ),
    );
  }
}
