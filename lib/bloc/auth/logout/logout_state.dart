part of 'logout_bloc.dart';
@immutable
abstract class LogoutState {}
class LogoutInitial extends LogoutState {}
class Loggingout extends LogoutState {}
class Logedout extends LogoutState {}
class LoggingoutError extends LogoutState {}
