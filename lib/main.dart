import 'package:daily_habits/data/repositories_impl/habit_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Модели, Datasource, Repository, UseCases
import 'data/models/habit_model.dart';
import 'data/datasources/habit_local_datasource.dart';
import 'domain/usecases/add_habits.dart';
import 'domain/usecases/get_habits.dart';
import 'domain/usecases/toggle_habits.dart';
import 'domain/usecases/delete_habits.dart';

// Cubit и State
import 'presentation/cubit/habit_cubit.dart';
import 'presentation/cubit/splash_cubit.dart';
import 'presentation/pages/splash_screen_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // --- Hive init ---
  await Hive.initFlutter();
  Hive.registerAdapter(HabitModelAdapter());
  final box = await Hive.openBox<HabitModel>('habitBox');

  // --- Repository ---
  final habitRepository = HabitRepositoryImpl(HabitLocalDatasource(box));

  // --- UseCases ---
  final getHabitsUseCase = GetHabitsUseCase(habitRepository);
  final addHabitsUseCase = AddHabitsUseCase(habitRepository);
  final toggleHabitsUseCase = ToggleHabitsUseCase(habitRepository);
  final deleteHabitsUseCase = DeleteHabitsUseCase(habitRepository);

  // --- Запуск приложения с MultiBlocProvider ---
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashCubit()),
        BlocProvider(
          create: (_) => HabitCubit(
            getHabitsUseCase: getHabitsUseCase,
            addHabitUseCase: addHabitsUseCase,
            toggleHabitsUseCase: toggleHabitsUseCase,
            deleteHabitsUseCase: deleteHabitsUseCase,
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

// --- MyApp ---
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Habits',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SplashScreenPage(), // стартовый экран
    );
  }
}
