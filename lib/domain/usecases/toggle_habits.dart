import 'package:daily_habits/domain/repositories/habit_repository.dart';

class ToggleHabitsUseCase {
  final HabitRepository repository;

  ToggleHabitsUseCase(this.repository);

  Future<void> call(int id) async {
    repository.toggleHabit(id);
  }
}
