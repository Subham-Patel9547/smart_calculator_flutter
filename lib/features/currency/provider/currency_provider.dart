import 'package:flutter/material.dart';

import '../data/constants/currency_list.dart';
import '../data/models/currency_model.dart';
import '../data/models/exchange_rate_model.dart';
import '../data/services/currency_repository.dart';

import '../../history/service/history_service.dart';


class CurrencyProvider extends ChangeNotifier {
  CurrencyProvider() {
    amountController.text = "1";
    loadRate();
  }

  final CurrencyRepository _repository = CurrencyRepository();

  /// Controllers
  final TextEditingController amountController = TextEditingController();

  final TextEditingController searchController = TextEditingController();

  /// Selected Currency
  CurrencyModel fromCurrency = currencyList.first;

  CurrencyModel toCurrency = currencyList[1];

  /// Search Result
  List<CurrencyModel> filteredCurrencies = List.from(currencyList);

  /// API Data
  ExchangeRateModel? rate;

  double convertedAmount = 0;

  bool loading = false;

  bool showResult = false;

  String? error;

  //---------------------------------------------------
  /// Search Currency
  //---------------------------------------------------

  void search(String value) {
    if (value.trim().isEmpty) {
      filteredCurrencies = List.from(currencyList);
    } else {
      filteredCurrencies = currencyList.where((currency) {
        return currency.code.toLowerCase().contains(value.toLowerCase()) ||
            currency.name.toLowerCase().contains(value.toLowerCase());
      }).toList();
    }

    notifyListeners();
  }

  //---------------------------------------------------
  /// Select Currency
  //---------------------------------------------------

  void selectFrom(CurrencyModel currency) {
    fromCurrency = currency;

    loadRate();

    notifyListeners();
  }

  void selectTo(CurrencyModel currency) {
    toCurrency = currency;

    loadRate();

    notifyListeners();
  }

  //---------------------------------------------------
  /// Swap
  //---------------------------------------------------

  Future<void> swapCurrency() async {
    final temp = fromCurrency;

    fromCurrency = toCurrency;

    toCurrency = temp;

    await loadRate();

    notifyListeners();
  }

  //---------------------------------------------------
  /// Live Rate
  //---------------------------------------------------

  Future<void> loadRate() async {
    try {
      loading = true;

      notifyListeners();

      rate = await _repository.getRate(
        from: fromCurrency.code,
        to: toCurrency.code,
      );

      loading = false;

      notifyListeners();
    } catch (e) {
      loading = false;

      error = e.toString();

      notifyListeners();
    }
  }

  //---------------------------------------------------
  /// Convert
  //---------------------------------------------------

  Future<void> convert() async {
    try {
      loading = true;

      showResult = false;

      notifyListeners();

      final amount = double.tryParse(amountController.text) ?? 0;

      convertedAmount = await _repository.convert(
        from: fromCurrency.code,
        to: toCurrency.code,
        amount: amount,
      );

      // Save History
      HistoryService.save(
        tool: "Currency",
        input:
            "${amount.toStringAsFixed(2)} ${fromCurrency.code} → ${toCurrency.code}",
        output: "${convertedAmount.toStringAsFixed(4)} ${toCurrency.code}",
      );

      showResult = true;

      loading = false;

      notifyListeners();
    } catch (e) {
      loading = false;

      error = e.toString();

      notifyListeners();
    }
  }

  //---------------------------------------------------
  /// Helpers
  //---------------------------------------------------

  String get liveRate {
    if (rate == null) return "";

    return "1 ${fromCurrency.code} = "
        "${rate!.rate.toStringAsFixed(4)} ${toCurrency.code}";
  }

  String get amountText =>
      amountController.text.isEmpty ? "0" : amountController.text;

  void clearSearch() {
    searchController.clear();

    filteredCurrencies = List.from(currencyList);

    notifyListeners();
  }

  @override
  void dispose() {
    amountController.dispose();
    searchController.dispose();
    super.dispose();
  }
}
