import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/currency_provider.dart';
import '../widgets/amount_field.dart';
import '../widgets/convert_button.dart';
import '../widgets/currency_card.dart';
import '../widgets/live_rate_card.dart';
import '../widgets/result_card.dart';
import '../widgets/swap_button.dart';
import 'currency_picker_screen.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CurrencyProvider(),
      child: const _CurrencyView(),
    );
  }
}

class _CurrencyView extends StatelessWidget {
  const _CurrencyView();

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrencyProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Currency Converter"),
          ),

          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  AmountField(controller: provider.amountController),

                  const SizedBox(height: 25),

                  CurrencyCard(
                    title: "From",
                    currency: provider.fromCurrency,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChangeNotifierProvider.value(
                            value: Provider.of<CurrencyProvider>(
                              context,
                              listen: false,
                            ),
                            child: const CurrencyPickerScreen(isFrom: true),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 18),

                  Center(child: SwapButton(onTap: provider.swapCurrency)),

                  const SizedBox(height: 18),

                  CurrencyCard(
                    title: "To",
                    currency: provider.toCurrency,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChangeNotifierProvider.value(
                            value: Provider.of<CurrencyProvider>(
                              context,
                              listen: false,
                            ),
                            child: const CurrencyPickerScreen(isFrom: false),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 22),

                  if (provider.rate != null)
                    LiveRateCard(rate: provider.liveRate),

                  const SizedBox(height: 28),

                  ConvertButton(
                    loading: provider.loading,
                    onPressed: provider.convert,
                  ),

                  const SizedBox(height: 25),
                  if (provider.showResult)
                    ResultCard(
                      fromCode: provider.fromCurrency.code,
                      toCode: provider.toCurrency.code,
                      amount:
                          "${provider.convertedAmount.toStringAsFixed(2)} ${provider.toCurrency.code}",
                      result: provider.convertedAmount,
                    ),

                  if (provider.error != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(.12),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          provider.error!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
