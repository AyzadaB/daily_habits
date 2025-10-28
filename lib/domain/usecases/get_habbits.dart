import 'package:daily_habits/domain/entities/habit_entity.dart';
import 'package:daily_habits/domain/repositories/habit_repository.dart';

class GetHabbitsUseCase {
  final HabitRepository repository;

  GetHabbitsUseCase(this.repository);

  List<HabitEntity> call() {
    return repository.getHabits();
  }
}

 //Мы храним ссылку на репозиторий,
  //через который UseCase получит данные из базы или API.
  //Repository — это как посредник между “логикой” и “хранилищем”.

//Вот главная логика:
//UseCase ничего не знает о Hive.
//Он просто вызывает метод у репозитория.
//Результат — это список сущностей HabitEntity.
//И — внимание! — тут используется особенность Dart:
//Метод call() позволяет вызывать объект как функцию.
