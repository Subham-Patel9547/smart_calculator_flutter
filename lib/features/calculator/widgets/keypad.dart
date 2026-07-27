import 'package:flutter/material.dart';
import '../provider/calculator_provider.dart';
import 'calculator_button.dart';

class Keypad extends StatelessWidget {
  final CalculatorProvider provider;

  const Keypad({
    super.key,
    required this.provider,
  });

  static const List<String> buttons = [
    "AC",
    "⌫",
    "%",
    "÷",
    "7",
    "8",
    "9",
    "×",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "00",
    "0",
    ".",
    "=",
  ];

  bool isOperator(String text) {
    return [
      "+",
      "-",
      "×",
      "÷",
      "=",
      "%",
      "AC",
      "⌫",
    ].contains(text);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: buttons.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final text = buttons[index];

        return CalculatorButton(
          text: text,
          backgroundColor:
              isOperator(text)
                  ? Colors.green
                  : const Color(0xff1D1D1D),
          textColor: Colors.white,
          onTap: () {
            provider.onButtonPressed(text);
          },
        );
      },
    );
  }
}