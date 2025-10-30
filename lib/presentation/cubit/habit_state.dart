import 'package:daily_habits/domain/entities/habit_entity.dart';

abstract class HabitState {}

class Habitinitial extends HabitState {}

class HabitLoaded extends HabitState {
  final List<HabitEntity> habits;

  HabitLoaded(this.habits);
}
