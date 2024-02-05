import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonClickedEvent>(loginButtonClickedEvent);
    // on<NavigateToHomeEvent>(navigateToHomeEvent);
  }

  FutureOr<void> loginButtonClickedEvent(
      LoginButtonClickedEvent event, Emitter<LoginState> emit) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', event.email);
      await prefs.setString('password', event.password);
      String email = prefs.getString('email') ?? '';
      String password = prefs.getString('password') ?? '';
      print(email);
      print(password);
      emit(LoginNavigateToHomeScreenState());
    } catch (e) {
      print("Error saving to SharedPreferences: $e");
    }
  }

  // FutureOr<void> navigateToHomeEvent(
  //     NavigateToHomeEvent event, Emitter<LoginState> emit) {
  //   print("navigate to home screen");
  //   emit(LoginNavigateToHomeScreenState());
  // }
}
