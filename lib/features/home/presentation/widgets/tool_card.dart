import 'package:flutter/material.dart';

class ToolCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const ToolCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        borderRadius: BorderRadius.circular(22),

        // Navigation HomeScreen se control hogi
        onTap: onTap,

        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: const Color(0xff1B1B1B),

            border: Border.all(color: Colors.white.withOpacity(.05)),

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(.02),
                Colors.white.withOpacity(.01),
              ],
            ),
          ),

          child: Stack(
            children: [
              // Glow Circle
              Positioned(
                right: -30,
                top: -30,

                child: Container(
                  width: 100,
                  height: 100,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.withOpacity(.08),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(18),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    // Icon Container
                    Container(
                      width: 52,
                      height: 52,

                      decoration: BoxDecoration(
                        color: color.withOpacity(.18),
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: Icon(icon, color: color, size: 26),
                    ),

                    const SizedBox(height: 12),

                    // Title
                    Text(
                      title,

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Subtitle
                    Text(
                      subtitle,

                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
