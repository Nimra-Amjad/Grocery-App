part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

abstract class LoginActionState extends LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedSuccessState extends LoginState {}

class LoginErrorState extends LoginState {}

class SaveDataState extends LoginState {}

class GetDataState extends LoginState {}

class RemoveDataState extends LoginState {}

class LoginNavigateToHomeScreenState extends LoginActionState {}
