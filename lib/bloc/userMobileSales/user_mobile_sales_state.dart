part of 'user_mobile_sales_bloc.dart';

@immutable
abstract class UserMobileSalesState {}

class UserMobileSalesInitial extends UserMobileSalesState {}
class UserMobileSalesLoading extends UserMobileSalesState {}
class UserMobileSalesLoaded extends UserMobileSalesState {
  List<MobileSale>MobileSales;
  UserMobileSalesLoaded(this.MobileSales);
}
class UserMobileSalesLoadingError extends UserMobileSalesState {
  String message;
  UserMobileSalesLoadingError(this.message);
}


