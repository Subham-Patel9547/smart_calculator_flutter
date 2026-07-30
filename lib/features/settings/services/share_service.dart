import 'package:share_plus/share_plus.dart';

class ShareService {
  static Future<void> shareApp() async {
    await SharePlus.instance.share(
      ShareParams(
        text: '''
🧮 Smart Calculator

Calculate everything in one app!

✔ Scientific Calculator
✔ GST Calculator
✔ EMI Calculator
✔ Loan Calculator
✔ Currency Converter
✔ Unit Converter

Download Now:
https://play.google.com/store/apps/details?id=com.yourcompany.smartcalculator
''',
      ),
    );
  }
}