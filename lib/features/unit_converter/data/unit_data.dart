import '../models/unit_model.dart';

class UnitData {
  /// ===========================
  /// LENGTH
  /// Base Unit = Meter
  /// ===========================
  static const List<UnitModel> length = [
    UnitModel(name: 'Millimeter', symbol: 'mm', factor: 0.001),
    UnitModel(name: 'Centimeter', symbol: 'cm', factor: 0.01),
    UnitModel(name: 'Meter', symbol: 'm', factor: 1),
    UnitModel(name: 'Kilometer', symbol: 'km', factor: 1000),
    UnitModel(name: 'Inch', symbol: 'in', factor: 0.0254),
    UnitModel(name: 'Foot', symbol: 'ft', factor: 0.3048),
    UnitModel(name: 'Yard', symbol: 'yd', factor: 0.9144),
    UnitModel(name: 'Mile', symbol: 'mi', factor: 1609.344),
  ];

  /// ===========================
  /// WEIGHT
  /// Base Unit = Kilogram
  /// ===========================
  static const List<UnitModel> weight = [
    UnitModel(name: 'Milligram', symbol: 'mg', factor: 0.000001),
    UnitModel(name: 'Gram', symbol: 'g', factor: 0.001),
    UnitModel(name: 'Kilogram', symbol: 'kg', factor: 1),
    UnitModel(name: 'Tonne', symbol: 't', factor: 1000),
    UnitModel(name: 'Ounce', symbol: 'oz', factor: 0.0283495),
    UnitModel(name: 'Pound', symbol: 'lb', factor: 0.453592),
  ];

  /// ===========================
  /// AREA
  /// Base Unit = Square Meter
  /// ===========================
  static const List<UnitModel> area = [
    UnitModel(name: 'Square Millimeter', symbol: 'mm²', factor: 0.000001),
    UnitModel(name: 'Square Centimeter', symbol: 'cm²', factor: 0.0001),
    UnitModel(name: 'Square Meter', symbol: 'm²', factor: 1),
    UnitModel(name: 'Square Kilometer', symbol: 'km²', factor: 1000000),
    UnitModel(name: 'Hectare', symbol: 'ha', factor: 10000),
    UnitModel(name: 'Acre', symbol: 'ac', factor: 4046.856422),
  ];

  /// ===========================
  /// VOLUME
  /// Base Unit = Liter
  /// ===========================
  static const List<UnitModel> volume = [
    UnitModel(name: 'Milliliter', symbol: 'ml', factor: 0.001),
    UnitModel(name: 'Liter', symbol: 'L', factor: 1),
    UnitModel(name: 'Cubic Meter', symbol: 'm³', factor: 1000),
    UnitModel(name: 'Gallon', symbol: 'gal', factor: 3.78541),
    UnitModel(name: 'Pint', symbol: 'pt', factor: 0.473176),
  ];

  /// ===========================
  /// SPEED
  /// Base Unit = Meter/Second
  /// ===========================
  static const List<UnitModel> speed = [
    UnitModel(name: 'Meter/Second', symbol: 'm/s', factor: 1),
    UnitModel(name: 'Kilometer/Hour', symbol: 'km/h', factor: 0.277778),
    UnitModel(name: 'Mile/Hour', symbol: 'mph', factor: 0.44704),
    UnitModel(name: 'Knot', symbol: 'kn', factor: 0.514444),
  ];

  /// ===========================
  /// DATA STORAGE
  /// Base Unit = Byte
  /// ===========================
  static const List<UnitModel> data = [
    UnitModel(name: 'Byte', symbol: 'B', factor: 1),
    UnitModel(name: 'Kilobyte', symbol: 'KB', factor: 1024),
    UnitModel(name: 'Megabyte', symbol: 'MB', factor: 1048576),
    UnitModel(name: 'Gigabyte', symbol: 'GB', factor: 1073741824),
    UnitModel(name: 'Terabyte', symbol: 'TB', factor: 1099511627776),
  ];

  /// ===========================
  /// TEMPERATURE
  /// (Special Formula)
  /// ===========================
  static const List<UnitModel> temperature = [
    UnitModel(name: 'Celsius', symbol: '°C', factor: 1),
    UnitModel(name: 'Fahrenheit', symbol: '°F', factor: 1),
    UnitModel(name: 'Kelvin', symbol: 'K', factor: 1),
  ];

  /// ===========================
  /// Categories
  /// ===========================
  static const List<String> categories = [
    "Length",
    "Weight",
    "Temp",
    "Area",
    "Volume",
    "Speed",
    "Data",
  ];

  static List<UnitModel> getUnits(String category) {
    switch (category) {
      case "Length":
        return length;

      case "Weight":
        return weight;

      case "Temp":
        return temperature;

      case "Area":
        return area;

      case "Volume":
        return volume;

      case "Speed":
        return speed;

      case "Data":
        return data;

      default:
        return length;
    }
  }
}