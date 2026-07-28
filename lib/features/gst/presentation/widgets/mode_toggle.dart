import 'package:flutter/material.dart';

class ModeToggle extends StatelessWidget {
  final bool includeGst;
  final ValueChanged<bool> onChanged;

  const ModeToggle({
    super.key,
    required this.includeGst,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "MODE",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
            letterSpacing: 1,
          ),
        ),

        const SizedBox(height: 10),

        Container(
          height: 46,

          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xff1C1C1E),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(.08)),
          ),

          child: Row(
            children: [
              Expanded(
                child: _toggleButton(
                  title: "Include GST",
                  selected: includeGst,
                  onTap: () => onChanged(true),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _toggleButton(
                  title: "Exclude GST",
                  selected: !includeGst,
                  onTap: () => onChanged(false),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _toggleButton({
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: selected
            ? const Color.fromARGB(12, 255, 255, 255)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: selected ? Colors.white : Colors.grey.shade400,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
