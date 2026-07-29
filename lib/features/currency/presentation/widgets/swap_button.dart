import 'package:flutter/material.dart';

class SwapButton extends StatelessWidget {
  final VoidCallback onTap;

  const SwapButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          color: Color(0xff4CAF50),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.swap_vert,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}