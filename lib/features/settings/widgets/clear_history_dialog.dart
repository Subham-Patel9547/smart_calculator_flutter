import 'package:flutter/material.dart';

import '../../history/service/history_service.dart';

class ClearHistoryDialog {
  static Future<bool> show(
    BuildContext context,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          title: Row(
            children: const [
              Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
              SizedBox(width: 10),
              Text("Clear History"),
            ],
          ),

          content: const Text(
            "Are you sure you want to delete all calculation history?\n\nThis action cannot be undone.",
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text("Cancel"),
            ),

            FilledButton.icon(
              icon: const Icon(Icons.delete),
              label: const Text("Delete"),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () async {
                await HistoryService.clear();

                if (context.mounted) {
                  Navigator.pop(context, true);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "History cleared successfully",
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );

    return result ?? false;
  }
}