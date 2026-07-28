import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_calculator/app/theme/app_colors.dart';

import '../providers/emi_provider.dart';

class EmiCalculatorScreen extends StatelessWidget {
  const EmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmiProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff101010),

      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.appBar, // Back arrow color
        ),

        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),

          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Text(
          "EMI Calculator",

          style: TextStyle(
            color: AppColors.appBar,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            height: 0.5,
            color: const Color.fromARGB(117, 224, 224, 224),
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            _label("LOAN AMOUNT"),
            _inputField(
              controller: provider.amountController,
              // hint: "Enter amount",
              suffix: "₹",
            ),

            const SizedBox(height: 25),

            _label("ANNUAL INTEREST RATE"),
            _inputField(
              controller: provider.rateController,
              // hint: "Enter interest",
              suffix: "%",
            ),

            const SizedBox(height: 25),

            _label(provider.isYear ? "TENURE (YEARS)" : "TENURE (MONTHS)"),

            _inputField(
              controller: provider.tenureController,
              hint: "Enter tenure",
            ),

            const SizedBox(height: 12),

            Container(
              height: 50,

              decoration: BoxDecoration(
                color: const Color(0xff222222),

                borderRadius: BorderRadius.circular(12),
              ),

              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        provider.changeTenureType(true);
                      },

                      child: _toggleButton("Years", provider.isYear),
                    ),
                  ),

                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        provider.changeTenureType(false);
                      },

                      child: _toggleButton("Months", !provider.isYear),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,

              height: 50,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                onPressed: () {
                  provider.calculate();
                },

                child: const Text(
                  "Calculate EMI",

                  style: TextStyle(
                    color: Colors.white,

                    fontSize: 18,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            if (provider.result != null) _resultCard(provider),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),

      child: Text(
        text,

        style: TextStyle(
          color: Colors.grey.shade500,

          fontSize: 14,

          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _inputField({
    required TextEditingController controller,
    String? prefix,
    String? suffix,
    String? hint,
  }) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: const Color(0xff242424),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),

        suffixIcon: suffix == null
            ? null
            : Padding(
                padding: const EdgeInsets.only(right: 16),
                child: IconTheme(
                  data: const IconThemeData(color: Colors.white70),
                  child: Text(
                    suffix,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

        suffixIconConstraints: const BoxConstraints(
          minWidth: 30,
          minHeight: 30,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xff4CAF50)),
        ),
      ),
    );
  }

  Widget _toggleButton(String text, bool selected) {
    return Container(
      margin: const EdgeInsets.all(4),

      decoration: BoxDecoration(
        color: selected ? Colors.grey.shade700 : Colors.transparent,

        borderRadius: BorderRadius.circular(14),
      ),

      child: Center(
        child: Text(
          text,

          style: TextStyle(
            color: Colors.white,

            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _resultCard(EmiProvider provider) {
    final result = provider.result!;

    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: const Color(0xff1B1B1B),

        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        children: [
          _resultRow("Monthly EMI", result.monthlyEmi),

          _resultRow("Total Interest", result.totalInterest),

          _resultRow("Total Payment", result.totalPayment),
        ],
      ),
    );
  }

  Widget _resultRow(String title, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(title, style: const TextStyle(color: Colors.white70)),

          Text(
            "₹ ${value.toStringAsFixed(2)}",

            style: const TextStyle(
              color: Colors.white,

              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
