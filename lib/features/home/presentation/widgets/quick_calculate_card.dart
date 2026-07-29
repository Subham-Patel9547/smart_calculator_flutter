import 'package:flutter/material.dart';

class QuickCalculateCard extends StatelessWidget {
  const QuickCalculateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () {
          // TODO:
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => const CalculatorScreen(),
          //   ),
          // );
        },
        child: Ink(
          height: 95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: Colors.white.withOpacity(.08),
            ),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff1C1C1C),
                Color(0xff162016),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -35,
                top: -35,
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green.withOpacity(.08),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0xff1E3520),
                      ),
                      child: const Center(
                        child: Text(
                          "🧮",
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Quick Calculate",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            "Open the scientific calculator",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(.05),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Colors.white70,
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