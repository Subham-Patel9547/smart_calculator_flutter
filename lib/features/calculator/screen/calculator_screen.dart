import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../provider/calculator_provider.dart';
import '../widgets/calculator_display.dart';
import '../widgets/calculator_keypad.dart';
import '../widgets/scientific_panel.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalculatorProvider(),
      child: Consumer<CalculatorProvider>(
        builder: (_, provider, __) {
          return Scaffold(
            backgroundColor: AppColors.background,

            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppColors.background,

              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),

              title: const Text(
                "Calculator",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),

              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 14,
                  ),
                  child: GestureDetector(
                    onTap: provider.toggleScientific,
                    child: AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 250,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: provider.scientificMode
                            ? AppColors.primary.withOpacity(.15)
                            : Colors.transparent,
                        borderRadius:
                            BorderRadius.circular(30),
                        border: Border.all(
                          color: AppColors.primary,
                        ),
                      ),
                      child: Text(
                        "SCI",
                        style: TextStyle(
                          color: provider.scientificMode
                              ? AppColors.primary
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),

            body: SafeArea(
              child: Column(
                children: [

                  /// Display
                  const CalculatorDisplay(),

                  /// Scientific Panel
                  AnimatedCrossFade(
                    firstChild:
                        const SizedBox.shrink(),

                    secondChild:
                        const ScientificPanel(),

                    crossFadeState:
                        provider.scientificMode
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,

                    duration: const Duration(
                      milliseconds: 250,
                    ),
                  ),

                  /// Keypad
                  const Expanded(
                    child: CalculatorKeypad(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}