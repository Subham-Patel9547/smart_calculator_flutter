import '../models/exchange_rate_model.dart';
import 'currency_api_service.dart';

class CurrencyRepository {
  Future<ExchangeRateModel> getRate({
    required String from,
    required String to,
  }) {
    return CurrencyApiService.instance.getRate(
      from: from,
      to: to,
    );
  }

  Future<double> convert({
    required String from,
    required String to,
    required double amount,
  }) {
    return CurrencyApiService.instance.convert(
      from: from,
      to: to,
      amount: amount,
    );
  }
}