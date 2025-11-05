import 'package:daily_habits/domain/entities/habit_entity.dart';
import 'package:daily_habits/domain/usecases/add_habits.dart';
import 'package:daily_habits/domain/usecases/get_habits.dart';
import 'package:daily_habits/domain/usecases/toggle_habits.dart';
import 'package:daily_habits/domain/usecases/delete_habits.dart';
import 'package:daily_habits/presentation/cubit/habit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HabitCubit extends Cubit<HabitState> {
  final GetHabitsUseCase getHabitsUseCase;
  final AddHabitsUseCase addHabitUseCase;
  final ToggleHabitsUseCase toggleHabitsUseCase;
  final DeleteHabitsUseCase deleteHabitsUseCase;

  HabitCubit({
    required this.getHabitsUseCase,
    required this.addHabitUseCase,
    required this.toggleHabitsUseCase,
    required this.deleteHabitsUseCase,
  }) : super(HabitInitial());

  Future<void> loadHabits() async {
    emit(HabitLoading());
    try {
      final habits = await getHabitsUseCase();
      emit(HabitLoaded(habits));
    } catch (e) {
      emit(HabitError(e.toString()));
    }
  }

  Future<void> addHabit(HabitEntity habit) async {
    // ✅ camelCase
    try {
      await addHabitUseCase(habit);
      await loadHabits(); // лучше await, чтобы порядок был правильный
    } catch (e) {
      emit(HabitError(e.toString()));
    }
  }

  Future<void> toggleHabit(int id) async {
    try {
      await toggleHabitsUseCase(id);
      await loadHabits(); // лучше await, чтобы порядок был правильный
    } catch (e) {
      emit(HabitError(e.toString()));
    }
  }

  Future<void> deleteHabit(int id) async {
    try {
      await deleteHabitsUseCase(id);
      await loadHabits(); // лучше await, чтобы порядок был правильный
    } catch (e) {
      emit(HabitError(e.toString()));
    }
  }
}
