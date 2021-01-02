part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class Registering extends RegisterState {}
class Registed extends RegisterState {}
class UserExist extends RegisterState {}
class RegisteringError extends RegisterState {}
