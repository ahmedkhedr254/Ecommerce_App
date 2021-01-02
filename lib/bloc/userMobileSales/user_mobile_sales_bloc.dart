import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/model/MobileSale.dart';
import 'package:ecommerce/data/repository/MabileSaleRepository.dart';
import 'package:meta/meta.dart';

part 'user_mobile_sales_event.dart';
part 'user_mobile_sales_state.dart';

class UserMobileSalesBloc extends Bloc<UserMobileSalesEvent, UserMobileSalesState> {
  final MobileSaleRepository rerpository;
  UserMobileSalesBloc(this.rerpository) : super(UserMobileSalesInitial());

  @override
  Stream<UserMobileSalesState> mapEventToState(
    UserMobileSalesEvent event,
  ) async* {
    if (event is getMobileSales){
      yield UserMobileSalesLoading();
      try {
        final UserLaptopSales = await rerpository.getMobileSales();
        yield UserMobileSalesLoaded(UserLaptopSales);
      }
      catch (e) {
        yield UserMobileSalesLoadingError('cant load tablets');
      }

    }
  }
}
