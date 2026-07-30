import 'package:flutter/material.dart';

class CalculatorButtonModel {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;

  const CalculatorButtonModel({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.fontSize = 22,
  });
}