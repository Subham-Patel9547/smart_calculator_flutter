import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class LegalService {
  static const String privacyPolicy =
      "https://subham-patel9547.github.io/smart-calculator-legal/privacy-policy.html";

  static const String termsConditions =
      "https://subham-patel9547.github.io/smart-calculator-legal/terms-and-conditions.html";

  static Future<void> openPrivacyPolicy() async {
    final uri = Uri.parse(privacyPolicy);

    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);

    debugPrint("Privacy launched: $launched");
  }

  static Future<void> openTerms() async {
    final uri = Uri.parse(termsConditions);

    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);

    debugPrint("Terms launched: $launched");
  }
}
