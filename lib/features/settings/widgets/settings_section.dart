import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //----------------------------------
        /// Section Title
        //----------------------------------

        Padding(
          padding: const EdgeInsets.only(
            left: 4,
            bottom: 10,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),

        //----------------------------------
        /// Card
        //----------------------------------

        Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: Colors.white.withOpacity(.05),
            ),
          ),
          child: Column(
            children: List.generate(
              children.length,
              (index) {
                return Column(
                  children: [
                    children[index],

                    if (index != children.length - 1)
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.white.withOpacity(.05),
                        indent: 70,
                        endIndent: 16,
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}