import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'check_auth_event.dart';
part 'check_auth_state.dart';

class CheckAuthBloc extends Bloc<CheckAuthEvent, CheckAuthState> {
  CheckAuthBloc() : super(NotAuthenticated());

  @override
  Stream<CheckAuthState> mapEventToState(
    CheckAuthEvent event,
  ) async* {
      if (event is StrartApp){
        bool check=await checkLogin();
        if(check){
          yield Authenticated();
        }
        else{
          yield NotAuthenticated();
        }
      }
  }
  Future<bool> checkLogin()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setString('token',token);
    String apiToken = prefs.getString('token');
    if (apiToken==null){return false;}
    else{return true;}
  }
}