import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/unit_provider.dart';

class SwapButton extends StatefulWidget {
  const SwapButton({super.key});

  @override
  State<SwapButton> createState() => _SwapButtonState();
}

class _SwapButtonState extends State<SwapButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UnitProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          onTap: () {
            _controller.forward(from: 0);
            provider.swapUnits();
          },
          child: RotationTransition(
            turns: Tween<double>(
              begin: 0,
              end: 0.5,
            ).animate(
              CurvedAnimation(
                parent: _controller,
                curve: Curves.easeInOut,
              ),
            ),
            child: Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: const Color(0xff4CAF50),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff4CAF50)
                        .withOpacity(.35),
                    blurRadius: 16,
                    spreadRadius: 2,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(
                Icons.swap_vert_rounded,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        );
      },
    );
  }
}