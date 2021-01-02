import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ecommerce/bloc/tablet/tablet_event.dart';
import 'package:ecommerce/bloc/tablet/tablet_state.dart';
import 'package:ecommerce/data/model/Tablet.dart';
import 'package:ecommerce/data/repository/TabletRerpository.dart';
class TabletBloc extends Bloc<TabletEvent, TabletState> {
  final TabletRerpository rerpository;
  TabletBloc(this.rerpository) : super(TabletInitial());

  @override

  Stream<TabletState> mapEventToState(TabletEvent event,) async* {
    if(event is GetAllTablets) {
      yield TabletLoading();

      try {
        final Tablets = await rerpository.getallTablet();
        yield TabletLoaded(Tablets);
      }
      catch (e) {
        yield TabletError('cant load Tablets');
      }
    }
    else if (event is GetLastTablets){
      yield LastTabletLoading();

      try {
        final Tablets = await rerpository.getLastTablet();
        yield LastTabletLoaded(Tablets);
      }
      catch (e) {
        print(e);
        yield LastTabletError('cant load Tablets');
      }
    }

  }





}
