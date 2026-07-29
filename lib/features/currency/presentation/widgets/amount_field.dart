import 'package:flutter/material.dart';

class AmountField extends StatelessWidget {
  final TextEditingController controller;

  const AmountField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        labelText: "Amount",
        hintText: "Enter Amount",
        prefixIcon: const Icon(Icons.currency_exchange),
        filled: true,
        fillColor: const Color(0xff1B1B1B),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}