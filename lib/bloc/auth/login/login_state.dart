part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class Loggingin extends LoginState {}
class Logedin extends LoginState {}
class LogginginError extends LoginState {}
