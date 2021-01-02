import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/model/TabletSale.dart';
import 'package:ecommerce/data/repository/TabletSaleRepository.dart';
import 'package:meta/meta.dart';

part 'user_tablet_sales_event.dart';
part 'user_tablet_sales_state.dart';

class UserTabletSalesBloc extends Bloc<UserTabletSalesEvent, UserTabletSalesState> {
  final TabletSaleRepository rerpository;
  UserTabletSalesBloc(this.rerpository) : super(UserTabletSalesInitial());

  @override
  Stream<UserTabletSalesState> mapEventToState(
    UserTabletSalesEvent event,
  ) async* {
    if (event is getTabletSales){
      yield UserTabletSalesLoading();
      try {
        final UserLaptopSales = await rerpository.getTabletSales();
        yield UserTabletSalesLoaded(UserLaptopSales);
      }
      catch (e) {
        yield UserTabletSalesLoadingError('cant load tablets');
      }

    }
  }
}
