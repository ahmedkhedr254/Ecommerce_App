part of 'user_laptop_sales_bloc.dart';

@immutable
abstract class UserLaptopSalesState {}

class UserLaptopSalesInitial extends UserLaptopSalesState {}
class UserLaptopSalesLoading extends UserLaptopSalesState {}
class UserLaptopSalesLoaded extends UserLaptopSalesState {
  List<LaptopSale>UserLaptopSales;
  UserLaptopSalesLoaded(this.UserLaptopSales);
}
class UserLaptopSalesLoaidngError extends UserLaptopSalesState {
  String message;
  UserLaptopSalesLoaidngError(this.message);
}







