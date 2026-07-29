import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/unit_model.dart';
import '../../provider/unit_provider.dart';

class UnitDropdown extends StatelessWidget {
  final bool isFrom;

  const UnitDropdown({
    super.key,
    required this.isFrom,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UnitProvider>(
      builder: (context, provider, child) {
        final selected =
            isFrom ? provider.fromUnit : provider.toUnit;

        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            _showBottomSheet(
              context,
              provider,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: const Color(0xff1B1B1B),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white10,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text(
                        isFrom
                            ? "From"
                            : "To",
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        selected.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        selected.symbol,
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),

                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 30,
                  color: Colors.white70,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBottomSheet(
    BuildContext context,
    UnitProvider provider,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor:
          const Color(0xff1B1B1B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      builder: (_) {
        return ListView.builder(
          padding: const EdgeInsets.all(18),
          itemCount: provider.units.length,
          itemBuilder: (context, index) {
            final unit =
                provider.units[index];

            final selected = isFrom
                ? provider.fromUnit == unit
                : provider.toUnit == unit;

            return ListTile(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(14),
              ),
              selected: selected,
              selectedTileColor:
                  const Color(0xff4CAF50),

              title: Text(
                unit.name,
                style: TextStyle(
                  color: selected
                      ? Colors.white
                      : Colors.white,
                  fontWeight:
                      FontWeight.w600,
                ),
              ),

              subtitle: Text(
                unit.symbol,
                style: TextStyle(
                  color: selected
                      ? Colors.white70
                      : Colors.white54,
                ),
              ),

              trailing: selected
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    )
                  : null,

              onTap: () {
                if (isFrom) {
                  provider.changeFrom(unit);
                } else {
                  provider.changeTo(unit);
                }

                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }
}