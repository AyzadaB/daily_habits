import 'package:daily_habits/domain/entities/habit_entity.dart';

abstract class HabitRepository {
  List<HabitEntity> getHabits();
  void addHabit(HabitEntity habbit);
  void toggleHabit(int id);
  void deleteHabit(int id);
}

//HabitRepository — это контракт, который говорит:

//"Я знаю, что можно получать привычки, но не знаю как именно (Hive, API и т.д.)"
