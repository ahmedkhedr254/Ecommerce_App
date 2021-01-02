import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/repository/Auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final Auth rerpository;

  LogoutBloc(this.rerpository) : super(LogoutInitial());

  @override
  Stream<LogoutState> mapEventToState(
    LogoutEvent event,
  ) async* {
    if (event is logout){
      yield Loggingout();
      try{
        var x=await rerpository.logout();
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();

        print(x);
        yield Logedout();
      }
      catch(err){
        yield  LoggingoutError();
        print(err);
      }
    }
  }
}
