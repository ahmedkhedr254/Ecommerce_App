part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class login extends LoginEvent{
  String email;
  String password;
  login(this.email,this.password);
}
