import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/repository/Auth.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final Auth rerpository;
  RegisterBloc(this.rerpository) : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterEvent){
      yield Registering();

        var respond = await rerpository.register(event.name, event.email, event.password, event.phone, event.country, event.city, event.street, event.HomeId, event.Birthday);

        SharedPreferences preferences = await SharedPreferences.getInstance();
        if (respond['state']){
          await preferences.setString('token',respond['token']);
          yield Registed();
        }
        else{
          yield UserExist();
        }



    }
  }
}
