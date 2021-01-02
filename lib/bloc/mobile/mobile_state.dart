
import 'package:ecommerce/data/model/Mobile.dart';

abstract class MobileState {}
//***************GetAllMobilesStates***********************************
abstract class GetAllMobilesState extends MobileState {}

class MobileInitial extends GetAllMobilesState {

}
class MobileLoading extends GetAllMobilesState{

}
class MobileLoaded extends GetAllMobilesState{
  List<Mobile> Mobiles;
  MobileLoaded(this.Mobiles);

}
class MobileError extends GetAllMobilesState{
  String message;
  MobileError(this.message);
}
//*******************GetLastMobilesStates****************************************
abstract class GetLastMobilesState extends MobileState {}

class LastMobileInitial extends GetLastMobilesState {

}
class LastMobileLoading extends GetLastMobilesState{

}
class LastMobileLoaded extends GetLastMobilesState{
  List<Mobile> Mobiles;
  LastMobileLoaded(this.Mobiles);

}
class LastMobileError extends GetLastMobilesState{
  String message;
  LastMobileError(this.message);
}
//****************************************************************************
