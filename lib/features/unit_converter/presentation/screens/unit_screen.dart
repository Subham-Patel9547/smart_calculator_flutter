import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/theme/app_colors.dart';
import '../../provider/unit_provider.dart';
import '../widgets/category_tabs.dart';
import '../widgets/input_filed.dart';
import '../widgets/result_table.dart';
import '../widgets/swap_button.dart';
import '../widgets/unit_dropdown.dart';

class UnitConverterScreen extends StatelessWidget {
  const UnitConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UnitProvider(),
      child: const _UnitConverterView(),
    );
  }
}

class _UnitConverterView extends StatelessWidget {
  const _UnitConverterView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Unit Converter",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: Consumer<UnitProvider>(
          builder: (context, provider, child) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  /// Categories
                  const CategoryTabs(),

                  const SizedBox(height: 24),

                  /// From Unit
                  const UnitDropdown(
                    isFrom: true,
                  ),

                  const SizedBox(height: 18),

                  /// Swap
                  const Center(
                    child: SwapButton(),
                  ),

                  const SizedBox(height: 18),

                  /// To Unit
                  const UnitDropdown(
                    isFrom: false,
                  ),

                  const SizedBox(height: 24),

                  /// Value
                  const InputField(),

                  const SizedBox(height: 28),

                  /// Result
                  const ResultTable(),

                  const SizedBox(height: 30),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}