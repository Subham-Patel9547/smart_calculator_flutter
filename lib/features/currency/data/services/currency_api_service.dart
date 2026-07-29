import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/exchange_rate_model.dart';

class CurrencyApiService {
  CurrencyApiService._();

  static final CurrencyApiService instance =
      CurrencyApiService._();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://open.er-api.com/v6",
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  Future<ExchangeRateModel> getRate({
    required String from,
    required String to,
  }) async {
    try {
      final response = await _dio.get(
        "/latest/$from",
      );

      if (response.statusCode == 200) {
        final data = response.data;

        final rates =
            Map<String, dynamic>.from(data["rates"]);

        final rate =
            (rates[to] as num).toDouble();

        return ExchangeRateModel(
          from: from,
          to: to,
          rate: rate,
        );
      }

      throw Exception("Unable to fetch rate");
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<double> convert({
    required String from,
    required String to,
    required double amount,
  }) async {
    final rate = await getRate(
      from: from,
      to: to,
    );

    return amount * rate.rate;
  }
}