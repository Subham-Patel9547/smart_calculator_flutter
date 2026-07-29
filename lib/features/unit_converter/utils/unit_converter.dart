import '../models/unit_model.dart';

class UnitConverter {
  ///--------------------------------------------------
  /// Normal Conversion
  ///--------------------------------------------------

  static double convert({
    required double value,
    required UnitModel from,
    required UnitModel to,
  }) {
    final baseValue = value * from.factor;

    return baseValue / to.factor;
  }

  ///--------------------------------------------------
  /// Temperature Conversion
  ///--------------------------------------------------

  static double convertTemperature({
    required double value,
    required String from,
    required String to,
  }) {
    if (from == to) return value;

    // Celsius
    if (from == "°C") {
      if (to == "°F") {
        return (value * 9 / 5) + 32;
      }

      if (to == "K") {
        return value + 273.15;
      }
    }

    // Fahrenheit
    if (from == "°F") {
      if (to == "°C") {
        return (value - 32) * 5 / 9;
      }

      if (to == "K") {
        return ((value - 32) * 5 / 9) + 273.15;
      }
    }

    // Kelvin
    if (from == "K") {
      if (to == "°C") {
        return value - 273.15;
      }

      if (to == "°F") {
        return ((value - 273.15) * 9 / 5) + 32;
      }
    }

    return value;
  }

  ///--------------------------------------------------
  /// Universal Convert
  ///--------------------------------------------------

  static double convertValue({
    required String category,
    required double value,
    required UnitModel from,
    required UnitModel to,
  }) {
    if (category == "Temp") {
      return convertTemperature(
        value: value,
        from: from.symbol,
        to: to.symbol,
      );
    }

    return convert(
      value: value,
      from: from,
      to: to,
    );
  }
}