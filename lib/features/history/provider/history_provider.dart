import 'package:flutter/material.dart';

import '../model/history_model.dart';
import '../service/history_service.dart';

class HistoryProvider extends ChangeNotifier {
  List<HistoryModel> _history = [];

  List<HistoryModel> _filteredHistory = [];

  String _selectedTool = "All";

  String _search = "";

  List<HistoryModel> get history => _filteredHistory;

  String get selectedTool => _selectedTool;

  final TextEditingController searchController =
      TextEditingController();

  HistoryProvider() {
    loadHistory();
  }

  //--------------------------------------------------
  /// Load History
  //--------------------------------------------------

  void loadHistory() {
    _history = HistoryService.getAll();

    _applyFilter();
  }

  //--------------------------------------------------
  /// Search
  //--------------------------------------------------

  void search(String value) {
    _search = value.trim().toLowerCase();

    _applyFilter();
  }

  //--------------------------------------------------
  /// Filter
  //--------------------------------------------------

  void changeTool(String tool) {
    _selectedTool = tool;

    _applyFilter();
  }

  //--------------------------------------------------
  /// Delete One
  //--------------------------------------------------

  Future<void> deleteHistory(
      HistoryModel model) async {
    await model.delete();

    loadHistory();
  }

  //--------------------------------------------------
  /// Clear All
  //--------------------------------------------------

  Future<void> clearHistory() async {
    await HistoryService.clear();

    loadHistory();
  }

  //--------------------------------------------------
  /// Refresh
  //--------------------------------------------------

  Future<void> refresh() async {
    loadHistory();
  }

  //--------------------------------------------------
  /// Filter Logic
  //--------------------------------------------------

  void _applyFilter() {
    _filteredHistory = _history.where((item) {
      final toolMatch = _selectedTool == "All" ||
          item.tool == _selectedTool;

      final searchMatch =
          item.tool.toLowerCase().contains(_search) ||
              item.input
                  .toLowerCase()
                  .contains(_search) ||
              item.output
                  .toLowerCase()
                  .contains(_search);

      return toolMatch && searchMatch;
    }).toList();

    notifyListeners();
  }

  //--------------------------------------------------
  /// Tool List
  //--------------------------------------------------

  List<String> get tools {
    final list = <String>["All"];

    for (final item in _history) {
      if (!list.contains(item.tool)) {
        list.add(item.tool);
      }
    }

    return list;
  }

  //--------------------------------------------------
  /// Count
  //--------------------------------------------------

  int get totalHistory => _history.length;

  bool get isEmpty => _history.isEmpty;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}