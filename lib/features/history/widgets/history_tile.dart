import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../model/history_model.dart';
import '../provider/history_provider.dart';
import '../service/history_service.dart';

class HistoryTile extends StatelessWidget {
  final HistoryModel history;

  const HistoryTile({
    super.key,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(history.key),

      direction: DismissDirection.endToStart,

      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),

      confirmDismiss: (_) async {
        return await showDialog<bool>(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: const Text("Delete History"),
                  content: const Text(
                    "Do you want to delete this history?",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text("Cancel"),
                    ),
                    FilledButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text("Delete"),
                    ),
                  ],
                );
              },
            ) ??
            false;
      },

      onDismissed: (_) {
        context
            .read<HistoryProvider>()
            .deleteHistory(history);
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            //------------------------------------------------
            /// Header
            //------------------------------------------------

            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor:
                      AppColors.primary.withOpacity(.15),
                  child: Icon(
                    HistoryService.iconData(
                      history.tool,
                    ),
                    color: AppColors.primary,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        history.tool,
                        style: const TextStyle(
                          fontWeight:
                              FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),

                      const SizedBox(height: 3),

                      Text(
                        DateFormat(
                          "dd MMM yyyy • hh:mm a",
                        ).format(history.dateTime),
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {
                    context
                        .read<HistoryProvider>()
                        .deleteHistory(history);
                  },
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            Divider(
              color: Colors.grey.shade800,
            ),

            const SizedBox(height: 14),

            const Text(
              "Input",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              history.input,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              "Output",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              history.output,
              style: const TextStyle(
                fontSize: 18,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}