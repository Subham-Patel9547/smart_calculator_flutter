import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../provider/unit_provider.dart';

class InputField extends StatelessWidget {
  const InputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UnitProvider>(
      builder: (context, provider, child) {
        return Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: const Color(0xff1B1B1B),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: Colors.white10,
            ),
          ),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              const Text(
                "VALUE",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [

                  Expanded(
                    child: TextField(
                      controller:
                          provider.valueController,

                      keyboardType:
                          const TextInputType.numberWithOptions(
                        decimal: true,
                      ),

                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d*'),
                        ),
                      ],

                      onChanged: (_) {
                        provider.convert();
                      },

                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),

                      decoration:
                          const InputDecoration(
                        hintText: "0",
                        hintStyle: TextStyle(
                          color: Colors.white24,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                      ),

                      cursorColor:
                          const Color(0xff4CAF50),
                    ),
                  ),

                  Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff2A2A2A),
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                    child: Text(
                      provider.fromUnit.symbol,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}