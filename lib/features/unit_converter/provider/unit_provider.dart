import 'package:flutter/material.dart';

import '../data/unit_data.dart';
import '../models/unit_model.dart';
import '../utils/unit_converter.dart';

import '../../history/service/history_service.dart';

class UnitProvider extends ChangeNotifier {
  final TextEditingController valueController = TextEditingController(
    text: "1",
  );

  /// Selected Category
  String selectedCategory = "Length";

  /// Units
  late List<UnitModel> units;

  late UnitModel fromUnit;

  late UnitModel toUnit;

  /// Result
  double convertedValue = 0;

  /// Result List
  Map<String, double> resultList = {};

  UnitProvider() {
    units = UnitData.getUnits(selectedCategory);

    fromUnit = units.first;

    toUnit = units[1];

    convert();
  }

  //------------------------------------------------
  /// Change Category
  //------------------------------------------------

  void changeCategory(String category) {
    selectedCategory = category;

    units = UnitData.getUnits(category);

    fromUnit = units.first;

    toUnit = units.length > 1 ? units[1] : units.first;

    convert();

    notifyListeners();
  }

  //------------------------------------------------
  /// From Unit
  //------------------------------------------------

  void changeFrom(UnitModel unit) {
    fromUnit = unit;

    convert();

    notifyListeners();
  }

  //------------------------------------------------
  /// To Unit
  //------------------------------------------------

  void changeTo(UnitModel unit) {
    toUnit = unit;

    convert();

    notifyListeners();
  }

  //------------------------------------------------
  /// Swap
  //------------------------------------------------

  void swapUnits() {
    final temp = fromUnit;

    fromUnit = toUnit;

    toUnit = temp;

    convert();

    notifyListeners();
  }

  //------------------------------------------------
  /// Convert
  //------------------------------------------------

  void convert() {
    final value = double.tryParse(valueController.text) ?? 0;

    convertedValue = UnitConverter.convertValue(
      category: selectedCategory,
      value: value,
      from: fromUnit,
      to: toUnit,
    );

    resultList.clear();

    for (final unit in units) {
      resultList[unit.symbol] = UnitConverter.convertValue(
        category: selectedCategory,
        value: value,
        from: fromUnit,
        to: unit,
      );
    }

    // Save History
    HistoryService.save(
      tool: "Unit Converter",
      input: "${format(value)} ${fromUnit.symbol} → ${toUnit.symbol}",
      output: "${format(convertedValue)} ${toUnit.symbol}",
    );

    notifyListeners();
  }

  //------------------------------------------------
  /// Formatter
  //------------------------------------------------

  String format(double value) {
    if (value == value.roundToDouble()) {
      return value.toStringAsFixed(0);
    }

    return value
        .toStringAsFixed(6)
        .replaceAll(RegExp(r'0+$'), '')
        .replaceAll(RegExp(r'\.$'), '');
  }

  @override
  void dispose() {
    valueController.dispose();
    super.dispose();
  }
}
