import 'dart:io';

import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../history/model/history_model.dart';
import '../../history/service/history_service.dart';

class ExportService {
  static Future<void> exportHistory() async {
    final List<HistoryModel> history =
        HistoryService.getAll();

    if (history.isEmpty) {
      throw Exception("No history available");
    }

    final List<List<dynamic>> rows = [];

    rows.add([
      "Tool",
      "Input",
      "Output",
      "Date",
      "Time",
    ]);

    for (final item in history) {
      rows.add([
        item.tool,
        item.input,
        item.output,
        item.dateTime.toLocal().toString().split(" ")[0],
        item.dateTime.toLocal().toString().split(" ")[1],
      ]);
    }

    final csv = const ListToCsvConverter().convert(rows);

    final directory =
        await getTemporaryDirectory();

    final file = File(
      "${directory.path}/SmartCalculator_History.csv",
    );

    await file.writeAsString(csv);

    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(file.path)],
        text: "Smart Calculator History",
      ),
    );
  }
}