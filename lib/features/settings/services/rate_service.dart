import 'package:url_launcher/url_launcher.dart';

class RateService {
  /// Replace this with your Play Store package id
  static const String packageName =

  /// app ppublish ke baad update
      "com.yourcompany.smartcalculator";

  static Future<void> rateApp() async {
    final Uri playStore = Uri.parse(
      "market://details?id=$packageName",
    );

    final Uri browser = Uri.parse(
      "https://play.google.com/store/apps/details?id=$packageName",
    );

    try {
      if (await canLaunchUrl(playStore)) {
        await launchUrl(
          playStore,
          mode: LaunchMode.externalApplication,
        );
      } else {
        await launchUrl(
          browser,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (_) {
      await launchUrl(
        browser,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}