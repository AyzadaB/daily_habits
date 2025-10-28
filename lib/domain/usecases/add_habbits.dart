import 'package:daily_habits/domain/entities/habit_entity.dart';
import 'package:daily_habits/domain/repositories/habit_repository.dart';

class AddHabbitsUseCase {
  final HabitRepository repository;

  AddHabbitsUseCase(this.repository);

  Future<void> call(HabitEntity habbit) async {
    repository.addHabit(habbit);
  }
}
