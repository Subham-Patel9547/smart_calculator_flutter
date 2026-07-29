import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.12),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.history,
                size: 60,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "No History Found",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Your calculator history will appear here after you perform your first calculation.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 15,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 35),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.12),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                "Start Calculating 🚀",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}