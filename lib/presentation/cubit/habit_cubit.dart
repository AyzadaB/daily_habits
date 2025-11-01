import 'package:daily_habits/domain/entities/habit_entity.dart';
import 'package:daily_habits/domain/usecases/add_habbits.dart';
import 'package:daily_habits/domain/usecases/get_habbits.dart';
import 'package:daily_habits/presentation/cubit/habit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HabitCubit extends Cubit<HabitState> {
  final GetHabitsUseCase getHabitsUseCase;
  final AddHabitsUseCase addHabitUseCase;

  HabitCubit({required this.getHabitsUseCase, required this.addHabitUseCase})
    : super(HabitInitial());

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
}
