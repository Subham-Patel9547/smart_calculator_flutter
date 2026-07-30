import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../widgets/settings_section.dart';
import '../widgets/settings_tile.dart';
import '../widgets/clear_history_dialog.dart';

import '../services/export_service.dart';
import '../services/rate_service.dart';
import '../services/share_service.dart';
import '../services/legel_services.dart';
import '../services/support_servies.dart';

import '../dialogs/about_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// Store
            SettingsSection(
              title: "STORE",
              children: [
                /// rate app
                SettingsTile(
                  icon: Icons.star,
                  iconColor: Colors.amber,
                  title: "Rate App",
                  subtitle: "Enjoying Smart Calculator?",
                  trailing: true,
                  onTap: () {
                    RateService.rateApp();
                  },
                ),

                /// share app
                SettingsTile(
                  icon: Icons.share,
                  iconColor: Colors.green,
                  title: "Share App",
                  subtitle: "Invite friends to try it",
                  trailing: true,
                  onTap: () {
                    ShareService.shareApp();
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// Legal
            SettingsSection(
              title: "LEGAL",
              children: [
                /// privacy policy
                SettingsTile(
                  icon: Icons.privacy_tip,
                  iconColor: Colors.orange,
                  title: "Privacy Policy",
                  subtitle: "",
                  trailing: true,
                  onTap: () async {
                    await LegalService.openPrivacyPolicy();
                  },
                ),

                /// term & conditions
                SettingsTile(
                  icon: Icons.description,
                  iconColor: Colors.blueGrey,
                  title: "Terms & Conditions",
                  subtitle: "",
                  trailing: true,
                  onTap: () async {
                    await LegalService.openTerms();
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// Data
            SettingsSection(
              title: "DATA",
              children: [
                /// clear history
                SettingsTile(
                  icon: Icons.delete,
                  iconColor: Colors.red,
                  title: "Clear History",
                  subtitle: "Remove all saved calculations",
                  trailing: true,
                  onTap: () async {
                    await ClearHistoryDialog.show(context);
                  },
                ),

                /// export csv
                SettingsTile(
                  icon: Icons.file_download_outlined,
                  iconColor: Colors.blue,
                  title: "Export CSV",
                  subtitle: "Download calculation history",
                  trailing: true,
                  onTap: () async {
                    try {
                      await ExportService.exportHistory();

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("History exported successfully"),
                          ),
                        );
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(e.toString())));
                      }
                    }
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// About
            SettingsSection(
              title: "ABOUT",
              children: [
                /// about
                SettingsTile(
                  icon: Icons.info,
                  iconColor: Colors.lightBlue,
                  title: "About Smart Calculator",
                  subtitle: "App information",
                  trailing: true,
                  onTap: () {
                    AboutDialogBox.show(context);
                  },
                ),

                /// report bugs
                SettingsTile(
                  icon: Icons.bug_report,
                  iconColor: Colors.orange,
                  title: "Report Bug",
                  subtitle: "Found an issue?",
                  trailing: true,
                  onTap: () {
                    SupportService.reportBug();
                  },
                ),

                /// contact support
                SettingsTile(
                  icon: Icons.support_agent,
                  iconColor: Colors.green,
                  title: "Contact Support",
                  subtitle: "Need help? Contact us",
                  trailing: true,
                  onTap: () {
                    SupportService.contactSupport();
                  },
                ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
