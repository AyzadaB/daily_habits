import 'package:daily_habits/data/models/habit_model.dart';
import 'package:hive/hive.dart';

class HabitLocalDatasource {
  final Box<HabitModel> box;

  HabitLocalDatasource(this.box);

  List<HabitModel> getHabits() {
    return box.values.toList();
  }

  Future<void> addHabit(HabitModel habitModel) async {}

  Future<void> deleteHabit(int id) async {}

  Future<void> toggleHabit(int id) async {}
}

//HabitLocalDataSource — это “локальный источник данных”.
//Он — как “мост” между Hive Box и Repository.

// Hive Box — это твоя локальная таблица (в памяти и на диске).
// DataSource — тот, кто знает как читать и писать туда данные.
//Box — это “коробка” Hive, где ты хранишь объекты HabitModel.
//Берёт все записи из Hive и превращает в список.

//box.values возвращает все элементы (Iterable)

//.toList() делает из этого обычный список
