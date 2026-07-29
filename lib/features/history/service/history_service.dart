import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/history_model.dart';

class HistoryService {
  static const String boxName = "history";

  static Box<HistoryModel> get _box =>
      Hive.box<HistoryModel>(boxName);

  //--------------------------------------------------------
  /// Save History
  //--------------------------------------------------------

  static Future<void> save({
    required String tool,
    required String input,
    required String output,
  }) async {
    final history = HistoryModel(
      tool: tool,
      input: input,
      output: output,
      dateTime: DateTime.now(),
      icon: _icon(tool),
    );

    await _box.add(history);
  }

  //--------------------------------------------------------
  /// Get All History
  //--------------------------------------------------------

  static List<HistoryModel> getAll() {
    final list = _box.values.toList();

    list.sort(
      (a, b) => b.dateTime.compareTo(a.dateTime),
    );

    return list;
  }

  //--------------------------------------------------------
  /// Delete One
  //--------------------------------------------------------

  static Future<void> delete(int index) async {
    await _box.deleteAt(index);
  }

  //--------------------------------------------------------
  /// Clear All
  //--------------------------------------------------------

  static Future<void> clear() async {
    await _box.clear();
  }

  //--------------------------------------------------------
  /// Count
  //--------------------------------------------------------

  static int count() {
    return _box.length;
  }

  //--------------------------------------------------------
  /// Tool Icon
  //--------------------------------------------------------

  static String _icon(String tool) {
    switch (tool) {
      case "Scientific":
        return "🧮";

      case "GST":
        return "🧾";

      case "EMI":
        return "💳";

      case "Loan":
        return "🏦";

      case "Currency":
        return "💱";

      case "Unit":
      case "Unit Converter":
        return "📏";

      case "Percentage":
        return "📊";

      default:
        return "📄";
    }
  }

  //--------------------------------------------------------
  /// IconData (optional)
  //--------------------------------------------------------

  static IconData iconData(String tool) {
    switch (tool) {
      case "Scientific":
        return Icons.calculate;

      case "GST":
        return Icons.receipt_long;

      case "EMI":
        return Icons.credit_card;

      case "Loan":
        return Icons.account_balance;

      case "Currency":
        return Icons.currency_exchange;

      case "Unit":
      case "Unit Converter":
        return Icons.straighten;

      case "Percentage":
        return Icons.percent;

      default:
        return Icons.history;
    }
  }
}