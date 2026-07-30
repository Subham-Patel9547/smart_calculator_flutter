import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../provider/calculator_provider.dart';

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(
      builder: (_, provider, __) {
        return Container(
          width: double.infinity,
          height: 170,
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: AppColors.background,
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(.06),
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //----------------------------------------
              /// Expression
              //----------------------------------------

              SingleChildScrollView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                child: Text(
                  provider.expression.isEmpty
                      ? " "
                      : provider.expression,
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              //----------------------------------------
              /// Result
              //----------------------------------------

              SingleChildScrollView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                child: Text(
                  provider.result,
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}