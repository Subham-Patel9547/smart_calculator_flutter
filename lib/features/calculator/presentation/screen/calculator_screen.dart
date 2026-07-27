import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/calculator_provider.dart';
import '../../widgets/calculator_display.dart';
import '../../widgets/keypad.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalculatorProvider(),
      child: const _CalculatorView(),
    );
  }
}

class _CalculatorView extends StatelessWidget {
  const _CalculatorView();

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "Calculator",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          body: SafeArea(
            child: Column(
              children: [

                /// Display
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: CalculatorDisplay(
                      expression: provider.expression,
                      result: provider.result,
                    ),
                  ),
                ),

                const Divider(
                  height: 1,
                  thickness: 1,
                ),

                /// Keypad
                Expanded(
                  flex: 5,
                  child: Keypad(
                    provider: provider,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}