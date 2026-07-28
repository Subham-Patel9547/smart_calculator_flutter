import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/screens/home_screen.dart';
// import '../screens/scientific/scientific_calculator_screen.dart';
import '../../features/gst/presentation/screens/gst_screen.dart';
import '../../features/emi/presentation/emi_calculator_screen.dart';
import '../../features/loan/presentation/loan_screen.dart';
// import '../screens/currency/currency_converter_screen.dart';
// import '../screens/unit/unit_converter_screen.dart';
// import '../screens/history/history_screen.dart';
// import '../screens/theme/theme_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [

      // Home
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),

      // Scientific Calculator
      // GoRoute(
      //   path: '/scientific',
      //   name: 'scientific',
      //   builder: (context, state) =>
      //       const ScientificCalculatorScreen(),
      // ),

      // GST Calculator
      GoRoute(
        path: '/gst',
        name: 'gst',
        builder: (context, state) =>
            const GstScreen(),
      ),

      // EMI Calculator
      GoRoute(
        path: '/emi',
        name: 'emi',
        builder: (context, state) =>
            const EmiCalculatorScreen(),
      ),

      // Loan Calculator
      GoRoute(
        path: '/loan',
        name: 'loan',
        builder: (context, state) =>
            const LoanScreen(),
      ),

      // Currency Converter
      // GoRoute(
      //   path: '/currency',
      //   name: 'currency',
      //   builder: (context, state) =>
      //       const CurrencyConverterScreen(),
      // ),

      // Unit Converter
      // GoRoute(
      //   path: '/unit',
      //   name: 'unit',
      //   builder: (context, state) =>
      //       const UnitConverterScreen(),
      // ),

      // History
      // GoRoute(
      //   path: '/history',
      //   name: 'history',
      //   builder: (context, state) =>
      //       const HistoryScreen(),
      // ),

      // Theme
      // GoRoute(
      //   path: '/theme',
      //   name: 'theme',
      //   builder: (context, state) =>
      //       const ThemeScreen(),
      // ),
    ],

    // Error Page
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text(
          "Page Not Found\n${state.error}",
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}