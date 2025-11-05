import 'package:daily_habits/domain/repositories/habit_repository.dart';

class DeleteHabitsUseCase {
  final HabitRepository repository;

  DeleteHabitsUseCase(this.repository);

  Future<void> call(int id) async {
    repository.deleteHabit(id);
  }
}
