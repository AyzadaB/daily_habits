import 'package:daily_habits/domain/entities/habit_entity.dart';
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

  HabitEntity toEntity() => HabitEntity(
    id: id,
    title: title,
    emoji: emoji,
    isCompleted: isCompleted,
    createdDate: createdDate,
  );

  factory HabitModel.fromEntity(HabitEntity entity) => HabitModel(
    id: entity.id,
    title: entity.title,
    emoji: entity.emoji,
    isCompleted: entity.isCompleted,
    createdDate: entity.createdDate,
  );

  HabitModel copyWith({
    int? id,
    String? title,
    String? emoji,
    bool? isCompleted,
    DateTime? createdDate,
  }) {
    return HabitModel(
      id: id ?? this.id,
      title: title ?? this.title,
      emoji: emoji ?? this.emoji,
      isCompleted: isCompleted ?? this.isCompleted,
      createdDate: createdDate ?? this.createdDate,
    );
  }
}
