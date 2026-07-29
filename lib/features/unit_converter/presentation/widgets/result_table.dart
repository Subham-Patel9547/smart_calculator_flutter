import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/unit_provider.dart';

class ResultTable extends StatelessWidget {
  const ResultTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UnitProvider>(
      builder: (context, provider, child) {
        final entries = provider.resultList.entries.toList();

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xff1B1B1B),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: Colors.white10,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Text(
                "${provider.format(double.tryParse(provider.valueController.text) ?? 0)} ${provider.fromUnit.symbol} EQUALS",
                style: const TextStyle(
                  color: Color(0xff4CAF50),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              const Divider(
                color: Colors.white12,
                height: 1,
              ),

              const SizedBox(height: 10),

              /// Result List
              ListView.separated(
                itemCount: entries.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const Divider(
                  color: Colors.white10,
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  final unit = provider.units[index];
                  final value = entries[index].value;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            unit.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        Text(
                          "${provider.format(value)} ${unit.symbol}",
                          style: const TextStyle(
                            color: Color(0xff4CAF50),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}