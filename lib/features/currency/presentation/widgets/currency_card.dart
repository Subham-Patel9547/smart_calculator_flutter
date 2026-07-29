import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

import '../../data/models/currency_model.dart';

class CurrencyCard extends StatelessWidget {
  final CurrencyModel currency;
  final String title;
  final VoidCallback onTap;

  const CurrencyCard({
    super.key,
    required this.currency,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: const Color(0xff1B1B1B),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: Colors.white.withOpacity(.05),
          ),
        ),
        child: Row(
          children: [
            CountryFlag.fromCountryCode(
              currency.countryCode,
              width: 42,
              height: 42,
              shape: const Circle(),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    currency.code,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    currency.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}