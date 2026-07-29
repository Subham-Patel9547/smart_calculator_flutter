import 'package:flutter/material.dart';

class LiveRateCard extends StatelessWidget {
  final String rate;

  const LiveRateCard({
    super.key,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(.12),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.show_chart,
            color: Colors.green,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              rate,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}