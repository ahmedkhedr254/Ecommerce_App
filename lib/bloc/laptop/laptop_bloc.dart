import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/model/Laptop.dart';
import 'package:ecommerce/data/repository/LaptopRepository.dart';
import 'package:meta/meta.dart';

part 'laptop_event.dart';
part 'laptop_state.dart';

class LaptopBloc extends Bloc<LaptopEvent, LaptopState> {
  final LaptopRerpository rerpository;
  LaptopBloc(this.rerpository) : super(LaptopInitial());

  @override

  Stream<LaptopState> mapEventToState(LaptopEvent event,) async* {
    if(event is GetAllLaptops) {
          yield LaptopLoading();

          try {
            final laptops = await rerpository.getallLaptop();
            yield LaptopLoaded(laptops);
          }
          catch (e) {
            yield LaptopError('cant load laptops');
          }
    }
    else if (event is GetLastLaptops){
      yield LastLaptopLoading();

      try {
        final laptops = await rerpository.getLastLaptop();
        yield LastLaptopLoaded(laptops);
      }
      catch (e) {
        print(e);
        yield LastLaptopError('cant load laptops');
      }
    }

  }





}
