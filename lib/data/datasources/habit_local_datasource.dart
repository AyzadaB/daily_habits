import 'package:daily_habits/data/models/habit_model.dart';
import 'package:hive/hive.dart';

class HabitLocalDatasource {
  final Box<HabitModel> box;

  HabitLocalDatasource(this.box);

  List<HabitModel> getHabits() {
    return box.values.toList();
  }
}

//HabitLocalDataSource — это “локальный источник данных”.
//Он — как “мост” между Hive Box и Repository.

// Hive Box — это твоя локальная таблица (в памяти и на диске).
// DataSource — тот, кто знает как читать и писать туда данные.
