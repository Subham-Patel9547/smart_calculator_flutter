import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../provider/history_provider.dart';
import '../widgets/empty_history.dart';
import '../widgets/history_search_bar.dart';
import '../widgets/history_tile.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HistoryProvider(),
      child: const _HistoryView(),
    );
  }
}

class _HistoryView extends StatelessWidget {
  const _HistoryView();

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppColors.background,

          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            centerTitle: true,

            title: const Text(
              "History",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            actions: [
              if (!provider.isEmpty)
                IconButton(
                  icon: const Icon(
                    Icons.delete_sweep_rounded,
                    color: Colors.red,
                  ),
                  onPressed: () async {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("Clear History"),
                        content: const Text(
                          "Delete all history?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(context, false),
                            child: const Text("Cancel"),
                          ),
                          FilledButton(
                            onPressed: () =>
                                Navigator.pop(context, true),
                            child: const Text("Delete"),
                          ),
                        ],
                      ),
                    );

                    if (confirm == true) {
                      await provider.clearHistory();
                    }
                  },
                ),
            ],
          ),

          body: RefreshIndicator(
            onRefresh: provider.refresh,

            child: Column(
              children: [
                //-----------------------------------
                /// Search
                //-----------------------------------

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: const HistorySearchBar(),
                ),

                //-----------------------------------
                /// Filter Chips
                //-----------------------------------

                SizedBox(
                  height: 42,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.tools.length,
                    itemBuilder: (_, index) {
                      final tool = provider.tools[index];

                      final selected =
                          tool == provider.selectedTool;

                      return Padding(
                        padding:
                            const EdgeInsets.only(right: 10),
                        child: ChoiceChip(
                          label: Text(tool),

                          selected: selected,

                          onSelected: (_) {
                            provider.changeTool(tool);
                          },

                          selectedColor:
                              AppColors.primary,

                          backgroundColor:
                              AppColors.card,

                          labelStyle: TextStyle(
                            color: selected
                                ? Colors.white
                                : Colors.white70,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 10),

                //-----------------------------------
                /// Count
                //-----------------------------------

                Padding(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
                  child: Align(
                    alignment:
                        Alignment.centerLeft,
                    child: Text(
                      "${provider.history.length} Calculations",
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                //-----------------------------------
                /// List
                //-----------------------------------

                Expanded(
                  child: provider.history.isEmpty
                      ? const EmptyHistory()
                      : ListView.builder(
                          padding:
                              const EdgeInsets.all(16),

                          itemCount:
                              provider.history.length,

                          itemBuilder: (_, index) {
                            return HistoryTile(
                              history:
                                  provider.history[index],
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}