import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String fromCode;
  final String toCode;
  final String amount;
  final double result;

  const ResultCard({
    super.key,
    required this.fromCode,
    required this.toCode,
    required this.amount,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xff1B1B1B),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [

          const Text(
            "Converted Amount",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            amount,
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Color(0xff4CAF50),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            toCode,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white70,
            ),
          ),

          const Divider(height: 35),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "From",
                style: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),

              Text(
                fromCode,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "To",
                style: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),

              Text(
                toCode,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [

              Text(
                "Converted Value",
                style: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),

              Text(
                result.toStringAsFixed(4),
                style: const TextStyle(
                  color: Color(0xff4CAF50),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}