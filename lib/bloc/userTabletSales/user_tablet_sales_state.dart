part of 'user_tablet_sales_bloc.dart';

@immutable
abstract class UserTabletSalesState {}

class UserTabletSalesInitial extends UserTabletSalesState {}

class UserTabletSalesLoading extends UserTabletSalesState {}
class UserTabletSalesLoaded extends UserTabletSalesState {
  List<TabletSale>TabletSales;
  UserTabletSalesLoaded(this.TabletSales);
}
class UserTabletSalesLoadingError extends UserTabletSalesState {
  String message;
  UserTabletSalesLoadingError(this.message);
}




