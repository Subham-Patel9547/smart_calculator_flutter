import 'package:flutter/material.dart';

class QuickActionCard extends StatelessWidget {
  const QuickActionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [
            Color(0xff4CAF50),
            Color(0xff2E7D32),
          ],
        ),
      ),
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [

          Text(
            "Quick Calculate",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          Spacer(),

          Text(
            "Scientific\nGST\nEMI\nLoan",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          )

        ],
      ),
    );
  }
}