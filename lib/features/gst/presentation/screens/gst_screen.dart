import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_calculator/app/theme/app_colors.dart';

import '../../provider/gst_provider.dart';
import '../widgets/amount_field.dart';
import '../widgets/gst_rate_chip.dart';
import '../widgets/gst_result_card.dart';
import '../widgets/mode_toggle.dart';

class GstScreen extends StatelessWidget {
  const GstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GstProvider(),
      child: const _GstView(),
    );
  }
}

class _GstView extends StatelessWidget {
  const _GstView();

  @override
  Widget build(BuildContext context) {
    return Consumer<GstProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: AppColors.appBar, // Back arrow color
            ),
            title: const Text(
              "GST Calculator",
              style: TextStyle(
                color: AppColors.appBar,
                fontWeight: FontWeight.w700,
              ),
            ),

            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1),
              child: Container(
                height: 0.5,
                color: const Color.fromARGB(117, 224, 224, 224),
              ),
            ),
          ),

          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Amount
                  AmountField(
                    controller: provider.amountController,
                    errorText: provider.errorText,
                    onChanged: (_) => provider.clearError(),
                  ),

                  const SizedBox(height: 24),

                  /// GST Rate
                  const Text(
                    "GST Rate",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.grey,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Wrap(
                    spacing: 1,
                    runSpacing: 10,
                    children: [3, 5, 12, 18, 28]
                        .map(
                          (rate) => GstRateChip(
                            rate: rate.toDouble(),
                            selectedRate: provider.selectedRate,
                            onSelected: provider.selectRate,
                          ),
                        )
                        .toList(),
                  ),

                  const SizedBox(height: 25),

                  /// Custom GST
                  TextField(
                    controller: provider.rateController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: InputDecoration(
                      labelText: "Custom GST Rate (%)",
                      labelStyle: const TextStyle(
                        color: AppColors.primary, // Label color
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      hintText: "Enter GST Rate",
                      suffix: const Icon(
                        Icons.percent,
                        size: 20,
                        color: AppColors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(.05),
                        ),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 1.5,
                        ),
                      ),

                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: Colors.red),
                      ),

                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1.5,
                        ),
                      ),
                    ),
                    onChanged: provider.onCustomRateChanged,
                  ),

                  const SizedBox(height: 25),

                  /// Include / Exclude
                  ModeToggle(
                    includeGst: provider.includeGst,
                    onChanged: provider.changeMode,
                  ),

                  const SizedBox(height: 15),

                  /// Calculate Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: provider.calculate,
                      icon: const Icon(Icons.calculate, color: Colors.white),
                      label: const Text(
                        "Calculate GST",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// Result
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    child: provider.result == null
                        ? const SizedBox()
                        : GstResultCard(
                            result: provider.result,
                            // onCopy: provider.copyResult,
                            onReset: provider.reset,
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
