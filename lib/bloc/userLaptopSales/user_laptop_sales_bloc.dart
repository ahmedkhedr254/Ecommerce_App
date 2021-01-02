import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/model/LaptopSale.dart';
import 'package:ecommerce/data/repository/LaptopSaleRepository.dart';
import 'package:meta/meta.dart';

part 'user_laptop_sales_event.dart';
part 'user_laptop_sales_state.dart';

class UserLaptopSalesBloc extends Bloc<UserLaptopSalesEvent, UserLaptopSalesState> {
  final LaptopSaleRepository rerpository;
  UserLaptopSalesBloc(this.rerpository) : super(UserLaptopSalesInitial());

  @override
  Stream<UserLaptopSalesState> mapEventToState(UserLaptopSalesEvent event,) async* {
      if (event is getLaptopSalesEvent){
        yield UserLaptopSalesLoading();
        try {
          final UserLaptopSales = await rerpository.getLaptopSales();
          yield UserLaptopSalesLoaded(UserLaptopSales);
        }
        catch (e) {
          yield UserLaptopSalesLoaidngError('cant load tablets');
        }

      }
  }
}
