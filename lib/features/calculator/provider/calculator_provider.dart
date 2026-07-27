import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider extends ChangeNotifier {
  String _expression = "";
  String _result = "0";

  String get expression => _expression;

  String get result => _result;

  void onButtonPressed(String value) {
    switch (value) {
      case "AC":
        clear();
        break;

      case "⌫":
        delete();
        break;

      case "=":
        calculate();
        break;

      default:
        addValue(value);
    }
  }

  void addValue(String value) {
    _expression += value;
    notifyListeners();
  }

  void clear() {
    _expression = "";
    _result = "0";
    notifyListeners();
  }

  void delete() {
    if (_expression.isNotEmpty) {
      _expression =
          _expression.substring(0, _expression.length - 1);

      notifyListeners();
    }
  }

  void calculate() {
    try {
      String exp = _expression
          .replaceAll("×", "*")
          .replaceAll("÷", "/");

      Parser parser = Parser();

      Expression expression = parser.parse(exp);

      ContextModel contextModel = ContextModel();

      double eval = expression.evaluate(
        EvaluationType.REAL,
        contextModel,
      );

      if (eval == eval.toInt()) {
        _result = eval.toInt().toString();
      } else {
        _result = eval.toString();
      }
    } catch (e) {
      _result = "Error";
    }

    notifyListeners();
  }
}