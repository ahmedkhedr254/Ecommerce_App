import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/repository/Auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Auth rerpository;

  LoginBloc(this.rerpository) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is login) {
      yield Loggingin();
      try {
        var respond = await rerpository.login(event.email, event.password);

        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.setString('token',respond['token']);
        yield Logedin();
      } catch (err) {
        yield LogginginError();
        print(err);
      }
    }
  }
}
