import 'package:url_launcher/url_launcher.dart';

class SupportService {
  static const String supportEmail = "subhampatel9547@gmail.com";

  //------------------------------------------------------
  /// Contact Support
  //------------------------------------------------------

  static Future<void> contactSupport() async {
    final subject = Uri.encodeComponent("Smart Calculator Support");

    final Uri email = Uri.parse("mailto:$supportEmail?subject=$subject");

    await launchUrl(email, mode: LaunchMode.externalApplication);
  }

  //------------------------------------------------------
  /// Report Bug
  //------------------------------------------------------

  static Future<void> reportBug() async {
    final subject = Uri.encodeComponent("Bug Report - Smart Calculator");

    final Uri email = Uri.parse("mailto:$supportEmail?subject=$subject");

    await launchUrl(email, mode: LaunchMode.externalApplication);
  }
}
