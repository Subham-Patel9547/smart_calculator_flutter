import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/loan_result.dart';

class LoanResultCard extends StatelessWidget {
  final LoanResult result;

  const LoanResultCard({super.key, required this.result});

  String money(double value) {
    return NumberFormat.currency(
      locale: 'en_IN',
      symbol: '₹',
      decimalDigits: 0,
    ).format(value);
  }

  double get percentage {
    if (result.totalPayment == 0) return 0;

    return (result.totalInterest /
            (result.totalPayment - result.totalInterest)) *
        100;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Summary Card
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff222222),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 22,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff233226),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(22),
                  ),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Monthly EMI",
                        style: TextStyle(color: Colors.white70, fontSize: 18),
                      ),
                    ),
                    Text(
                      money(result.monthlyEmi),
                      style: const TextStyle(
                        color: Color(0xff4CAF50),
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                      ),
                    ),
                  ],
                ),
              ),

              _row("Total Interest", money(result.totalInterest)),

              Divider(color: Colors.white.withOpacity(.05), height: 1),

              _row("Total Payment", money(result.totalPayment)),
            ],
          ),
        ),

        const SizedBox(height: 22),

        /// Info Card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xff214227)),
            gradient: const LinearGradient(
              colors: [Color(0xff171717), Color(0xff101512)],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("💡", style: TextStyle(fontSize: 26)),

              const SizedBox(width: 15),

              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      height: 1.5,
                    ),
                    children: [
                      const TextSpan(text: "You'll pay "),
                      TextSpan(
                        text: money(result.totalInterest),
                        style: const TextStyle(
                          color: Color(0xff4CAF50),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: " as interest — that's "),
                      TextSpan(
                        text: "${percentage.toStringAsFixed(1)}%",
                        style: const TextStyle(
                          color: Color(0xff4CAF50),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: " of your principal loan amount."),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
