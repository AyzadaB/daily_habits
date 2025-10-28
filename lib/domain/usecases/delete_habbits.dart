import 'package:daily_habits/domain/repositories/habit_repository.dart';

class ToggleHabbitsUseCase {
  final HabitRepository repository;

  ToggleHabbitsUseCase(this.repository);

  Future<void> call(int id) async {
    repository.deleteHabit(id);
  }
}
