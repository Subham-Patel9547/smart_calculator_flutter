import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/currency_model.dart';
import '../../provider/currency_provider.dart';

class CurrencyPickerScreen extends StatelessWidget {
  const CurrencyPickerScreen({
    super.key,
    required this.isFrom,
  });

  final bool isFrom;

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              isFrom
                  ? "Select From Currency"
                  : "Select To Currency",
            ),
            centerTitle: true,
          ),

          body: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: provider.searchController,
                  onChanged: provider.search,
                  decoration: InputDecoration(
                    hintText: "Search Currency",
                    prefixIcon: const Icon(Icons.search),

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount:
                      provider.filteredCurrencies.length,

                  itemBuilder: (context, index) {
                    final currency =
                        provider.filteredCurrencies[index];

                    return CurrencyTile(
                      currency: currency,
                      onTap: () {
                        if (isFrom) {
                          provider.selectFrom(currency);
                        } else {
                          provider.selectTo(currency);
                        }

                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CurrencyTile extends StatelessWidget {
  final CurrencyModel currency;

  final VoidCallback onTap;

  const CurrencyTile({
    super.key,
    required this.currency,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CountryFlag.fromCountryCode(
        currency.countryCode,
        width: 36,
        height: 36,
        shape: const Circle(),
      ),

      title: Text(
        currency.code,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),

      subtitle: Text(currency.name),

      trailing: const Icon(
        Icons.chevron_right,
      ),

      onTap: onTap,
    );
  }
}