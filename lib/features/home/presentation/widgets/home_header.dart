import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning 👋";
    } else if (hour < 17) {
      return "Good Afternoon ☀️";
    } else {
      return "Good Evening 🌙";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Avatar
        // Container(
        //   width: 58,
        //   height: 58,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(18),
        //     gradient: const LinearGradient(
        //       colors: [
        //         Color(0xff4CAF50),
        //         Color(0xff2E7D32),
        //       ],
        //     ),
        //   ),
        //   child: const Icon(
        //     Icons.calculate_rounded,
        //     color: Colors.white,
        //     size: 30,
        //   ),
        // ),

        // const SizedBox(width: 16),

        /// Greeting
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getGreeting(),
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                "Smart Calculator",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),

        // /// Notification Button
        // Container(
        //   width: 48,
        //   height: 48,
        //   decoration: BoxDecoration(
        //     color: const Color(0xff1C1C1C),
        //     borderRadius: BorderRadius.circular(16),
        //     border: Border.all(
        //       color: Colors.white.withOpacity(.06),
        //     ),
        //   ),
        //   child: IconButton(
        //     splashRadius: 22,
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.notifications_none_rounded,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}