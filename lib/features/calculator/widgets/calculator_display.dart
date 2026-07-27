import 'package:flutter/material.dart';

class CalculatorDisplay extends StatelessWidget {

  final String expression;
  final String result;

  const CalculatorDisplay({
    super.key,
    required this.expression,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          Text(
            expression,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            result,
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],
      ),
    );
  }
}