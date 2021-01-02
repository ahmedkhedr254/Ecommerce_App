part of 'check_auth_bloc.dart';

@immutable
abstract class CheckAuthState {}

class Authenticated extends CheckAuthState {}
class NotAuthenticated extends CheckAuthState {}


