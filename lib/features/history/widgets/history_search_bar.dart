import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../provider/history_provider.dart';

class HistorySearchBar extends StatelessWidget {
  const HistorySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(
      builder: (context, provider, child) {
        return Container(
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Colors.white10,
            ),
          ),
          child: TextField(
            controller: provider.searchController,
            onChanged: provider.search,
            textInputAction: TextInputAction.search,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 16,
              ),

              hintText: "Search history...",
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
              ),

              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),

              suffixIcon: provider.searchController.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: () {
                        provider.searchController.clear();
                        provider.search("");
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}