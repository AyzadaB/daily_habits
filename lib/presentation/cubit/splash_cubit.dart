import 'package:daily_habits/presentation/cubit/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> init() async {
    await Future.delayed(Duration(seconds: 2));
    emit(SplashLoaded());
  }
}
