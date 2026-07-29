import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/unit_data.dart';
import '../../provider/unit_provider.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UnitProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          height: 46,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: UnitData.categories.length,
            separatorBuilder: (_, __) =>
                const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final category =
                  UnitData.categories[index];

              final selected =
                  provider.selectedCategory ==
                      category;

              return InkWell(
                borderRadius:
                    BorderRadius.circular(25),
                onTap: () {
                  provider.changeCategory(category);
                },
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 250,
                  ),
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: selected
                        ? const Color(0xff4CAF50)
                        : const Color(0xff1B1B1B),
                    borderRadius:
                        BorderRadius.circular(25),
                    border: Border.all(
                      color: selected
                          ? Colors.transparent
                          : Colors.white10,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      category,
                      style: TextStyle(
                        color: selected
                            ? Colors.white
                            : Colors.white70,
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}