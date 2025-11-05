import 'package:daily_habits/presentation/cubit/splash_cubit.dart';
import 'package:daily_habits/presentation/cubit/splash_state.dart';
import 'package:daily_habits/presentation/pages/habits_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  SplashScreenPageState createState() => SplashScreenPageState();
}

class SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    context.read<SplashCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashLoaded) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HabitsPage()),
          );
        }
      },
      child: Scaffold(
        body: SizedBox.expand(
          child: Image.asset(
            "assets/images/splash-image.jpg",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
