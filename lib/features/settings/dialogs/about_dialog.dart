import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutDialogBox {
  static Future<void> show(BuildContext context) async {
    final info = await PackageInfo.fromPlatform();

    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          contentPadding: const EdgeInsets.all(24),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //--------------------------------
              /// App Logo
              //--------------------------------

              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xff019787).withOpacity(.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.calculate_rounded,
                  size: 45,
                  color: Color(0xff019787),
                ),
              ),

              const SizedBox(height: 20),

              //--------------------------------
              /// App Name
              //--------------------------------

              const Text(
                "Smart Calculator",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Version ${info.version}",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),

              Text(
                "Build ${info.buildNumber}",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 20),

              const Divider(),

              const SizedBox(height: 20),

              const Text(
                "A modern calculator with multiple smart tools including Scientific, GST, EMI, Loan, Currency and Unit Converter.",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 25),

              Text(
                "Developed by",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "Subham Patel \n 7266896432",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),

              FilledButton(
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  backgroundColor: const Color(0xff019787),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Close"),
              ),
            ],
          ),
        );
      },
    );
  }
}