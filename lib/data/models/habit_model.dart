import 'package:hive_flutter/hive_flutter.dart';
part 'habit_model.g.dart';

@HiveType(typeId: 0)
class HabitModel extends HiveObject {
  HabitModel({
    required this.id,
    required this.title,
    required this.emoji,
    required this.isCompleted,
    required this.createdDate,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String emoji;

  @HiveField(3)
  final bool isCompleted;

  @HiveField(4)
  final DateTime createdDate;
}
