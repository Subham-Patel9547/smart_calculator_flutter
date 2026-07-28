import 'package:flutter/material.dart';

class GstRateChip extends StatelessWidget {
  final double rate;
  final double selectedRate;
  final ValueChanged<double> onSelected;

  const GstRateChip({
    super.key,
    required this.rate,
    required this.selectedRate,
    required this.onSelected,
  });

  bool get isSelected => rate == selectedRate;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(right: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => onSelected(rate),
          child: Ink(
            width: 45,
            height: 35,
            decoration: BoxDecoration(
              borderRadius:isSelected? BorderRadius.circular(16):BorderRadius.circular(16),
              color: isSelected
                  ? const Color.fromARGB(6, 138, 157, 139)
                  : const Color(0xff1C1C1E),
              border: Border.all(
                color: isSelected
                    ? const Color(0xff4CAF50)
                    : Colors.white.withOpacity(.08),
              ),
              // color:isSelected? Colors.amber:Colors.pink
            ),
            child: Center(
              child: Text(
                "${rate.toInt()}%",
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey.shade300,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}