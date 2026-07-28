import 'package:flutter/material.dart';
import 'package:smart_calculator/app/theme/app_colors.dart';

class AmountField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const AmountField({
    super.key,
    required this.controller,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Amount",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.grey
          ),
        ),

        const SizedBox(height: 10),

        TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
          ),
          onChanged: onChanged,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            // hintText: "Enter Amount",

            suffix: Container(
              width: 15,
              alignment: Alignment.center,
              child: const Text(
                "₹",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            suffixIcon: controller.text.isNotEmpty
                ? IconButton(
                    onPressed: controller.clear,
                    icon: const Icon(Icons.close),
                  )
                : null,

            errorText: errorText,

            filled: true,
            fillColor: const Color(0xff1C1C1E),

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
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
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}