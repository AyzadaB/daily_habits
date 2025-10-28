import 'package:daily_habits/domain/entities/habit_entity.dart';

abstract class HabitRepository {
  List<HabitEntity> getHabits();
  void addHabit(HabitEntity habbit);
  void toggleHabit(int id);
  void deleteHabit(int id);
}
