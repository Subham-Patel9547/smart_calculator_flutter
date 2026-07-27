import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundGlow extends StatelessWidget {
  const BackgroundGlow({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          /// Top Right Glow
          Positioned(
            top: -120,
            right: -120,
            child: _glow(
              size: 320,
              color: const Color(0xff00E676),
            ),
          ),

          /// Top Left Small Glow
          Positioned(
            top: -70,
            left: -70,
            child: _glow(
              size: 170,
              color: Colors.greenAccent,
            ),
          ),

          /// Bottom Glow
          Positioned(
            bottom: -150,
            left: -100,
            child: _glow(
              size: 280,
              color: const Color(0xff4CAF50),
            ),
          ),
        ],
      ),
    );
  }

  Widget _glow({
    required double size,
    required Color color,
  }) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(
        sigmaX: 90,
        sigmaY: 90,
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(.22),
        ),
      ),
    );
  }
}