import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/gst_result.dart';

class GstResultCard extends StatelessWidget {
  final GstResult? result;
  final VoidCallback? onCopy;
  final VoidCallback? onReset;

  const GstResultCard({
    super.key,
    required this.result,
    this.onCopy,
    this.onReset,
  });

  String currency(double value) {
    return NumberFormat.currency(
      locale: 'en_IN',
      symbol: '₹',
      decimalDigits: 2,
    ).format(value);
  }

  @override
  Widget build(BuildContext context) {
    if (result == null) {
      return const SizedBox();
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff1C1C1E),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white.withOpacity(.06),
        ),
      ),
      child: Column(
        children: [

          /// Header
          Row(
            children: [
              const Icon(
                Icons.receipt_long,
                color: Color(0xff4CAF50),
              ),

              const SizedBox(width: 10),

              const Expanded(
                child: Text(
                  "GST Summary",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              IconButton(
                onPressed: onCopy,
                icon: const Icon(Icons.copy_rounded),
              ),
            ],
          ),

          const SizedBox(height: 20),

          _row(
            title: result!.includeGst
                ? "Final Amount"
                : "Original Amount",
            value: currency(
              result!.includeGst
                  ? result!.totalAmount
                  : result!.originalAmount,
            ),
          ),

          const SizedBox(height: 14),

          _row(
            title:
                "GST (${result!.gstRate.toStringAsFixed(0)}%)",
            value: currency(result!.gstAmount),
          ),

          const Divider(height: 28),

          _row(
            title: result!.includeGst
                ? "Original Amount"
                : "Total Amount",
            value: currency(
              result!.includeGst
                  ? result!.originalAmount
                  : result!.totalAmount,
            ),
            isTotal: true,
          ),

          const SizedBox(height: 22),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: onReset,
              icon: const Icon(Icons.refresh),
              label: const Text("Reset"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row({
    required String title,
    required String value,
    bool isTotal = false,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 15,
          ),
        ),

        const Spacer(),

        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 22 : 18,
            fontWeight:
                isTotal ? FontWeight.bold : FontWeight.w600,
            color: isTotal
                ? const Color(0xff4CAF50)
                : Colors.white,
          ),
        ),
      ],
    );
  }
}