import 'package:daily_habits/domain/entities/habit_entity.dart';
import 'package:daily_habits/domain/repositories/habit_repository.dart';

class AddHabitsUseCase {
  final HabitRepository repository;

  AddHabitsUseCase(this.repository);

  Future<void> call(HabitEntity habbit) async {
    repository.addHabit(habbit);
  }
}
