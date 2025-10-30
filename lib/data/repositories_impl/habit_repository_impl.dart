import 'package:daily_habits/data/datasources/habit_local_datasource.dart';
import 'package:daily_habits/data/models/habit_model.dart';
import 'package:daily_habits/domain/entities/habit_entity.dart';
import 'package:daily_habits/domain/repositories/habit_repository.dart';

class HabitRepositoryImpl implements HabitRepository {
  final HabitLocalDatasource localDataSource;

  HabitRepositoryImpl(this.localDataSource);

  @override
  List<HabitEntity> getHabits() {
    return localDataSource.getHabits().map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> addHabit(HabitEntity entity) async {
    await localDataSource.addHabit(HabitModel.fromEntity(entity));
  }

  @override
  Future<void> deleteHabit(int id) async {
    await localDataSource.deleteHabit(id);
  }

  @override
  Future<void> toggleHabit(int id) async {
    await localDataSource.toggleHabit(id);
  }
}
