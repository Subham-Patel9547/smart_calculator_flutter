import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './app/routes/app_routes.dart';
import './features/gst/provider/gst_provider.dart';
import './features/emi/providers/emi_provider.dart';
import './app/theme/app_theme.dart';
import 'providers/calculator_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        // GST Calculator State
        ChangeNotifierProvider(create: (_) => GstProvider()),

        // EMI
        ChangeNotifierProvider(create: (_) => EmiProvider()),

        // Theme State
        // ChangeNotifierProvider(
        //   create: (_) => ThemeProvider(),
        // ),

        // Calculator State
        // ChangeNotifierProvider(
        //   create: (_) => CalculatorProvider(),
        // ),
      ],

      child: const SmartCalculatorApp(),
    ),
  );
}

class SmartCalculatorApp extends StatelessWidget {
  const SmartCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeProvider =
    //     Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      title: "Smart Calculator",

      debugShowCheckedModeBanner: false,

      // Go Router
      routerConfig: AppRouter.router,

      // Theme
      // themeMode: themeProvider.themeMode,
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF019787)),

        brightness: Brightness.light,

        scaffoldBackgroundColor: Colors.white,

        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF019787),
          brightness: Brightness.dark,
        ),

        brightness: Brightness.dark,

        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
      ),
    );
  }
}
