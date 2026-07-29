import 'package:hive/hive.dart';

part 'history_model.g.dart';

@HiveType(typeId: 0)
class HistoryModel extends HiveObject {
  @HiveField(0)
  final String tool;

  @HiveField(1)
  final String input;

  @HiveField(2)
  final String output;

  @HiveField(3)
  final DateTime dateTime;

  @HiveField(4)
  final String icon;

  HistoryModel({
    required this.tool,
    required this.input,
    required this.output,
    required this.dateTime,
    required this.icon,
  });
}