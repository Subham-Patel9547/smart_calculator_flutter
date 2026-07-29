import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './app/routes/app_routes.dart';
import './features/gst/provider/gst_provider.dart';
import './features/emi/providers/emi_provider.dart';
import './app/theme/app_theme.dart';
import 'providers/calculator_provider.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'features/history/model/history_model.dart';
import 'features/history/service/history_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(HistoryModelAdapter());

  await Hive.openBox<HistoryModel>(HistoryService.boxName);

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
