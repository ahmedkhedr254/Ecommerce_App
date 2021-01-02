part of 'laptop_bloc.dart';

abstract class LaptopState {}
//***************GetAllLaptopsStates***********************************
abstract class GetAllLaptopsState extends LaptopState {}

class LaptopInitial extends GetAllLaptopsState {

}
class LaptopLoading extends GetAllLaptopsState{

}
class LaptopLoaded extends GetAllLaptopsState{
  List<Laptop> laptops;
  LaptopLoaded(this.laptops);

}
class LaptopError extends GetAllLaptopsState{
  String message;
  LaptopError(this.message);
}
//*******************GetLastLaptopsStates****************************************
abstract class GetLastLaptopsState extends LaptopState {}

class LastLaptopInitial extends GetLastLaptopsState {

}
class LastLaptopLoading extends GetLastLaptopsState{

}
class LastLaptopLoaded extends GetLastLaptopsState{
  List<Laptop> laptops;
  LastLaptopLoaded(this.laptops);

}
class LastLaptopError extends GetLastLaptopsState{
  String message;
  LastLaptopError(this.message);
}
//****************************************************************************
