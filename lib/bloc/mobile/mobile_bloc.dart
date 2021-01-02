import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/model/Mobile.dart';
import 'package:ecommerce/data/repository/MobileRepository.dart';
import 'package:meta/meta.dart';

import 'mobile_event.dart';
import 'mobile_state.dart';

class MobileBloc extends Bloc<MobileEvent, MobileState> {
  final MobileRerpository rerpository;

  MobileBloc(this.rerpository) : super(MobileInitial());

  @override
  Stream<MobileState> mapEventToState(
    MobileEvent event,
  ) async* {
    if (event is GetAllMobiles) {
      yield MobileLoading();

      try {
        final Mobiles = await rerpository.getallMobile();
        yield MobileLoaded(Mobiles);
      } catch (e) {
        yield MobileError('cant load Mobiles');
      }
    } else if (event is GetLastMobiles) {
      yield LastMobileLoading();

      try {
        final Mobiles = await rerpository.getLastMobile();
        yield LastMobileLoaded(Mobiles);
      } catch (e) {
        print(e);
        yield LastMobileError('cant load Mobiles');
      }
    }
  }
}
