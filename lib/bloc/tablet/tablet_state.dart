
import 'package:ecommerce/data/model/Tablet.dart';

abstract class TabletState {}
//***************GetAllTabletsStates***********************************
abstract class GetAllTabletsState extends TabletState {}

class TabletInitial extends GetAllTabletsState {

}
class TabletLoading extends GetAllTabletsState{

}
class TabletLoaded extends GetAllTabletsState{
  List<Tablet> Tablets;
  TabletLoaded(this.Tablets);

}
class TabletError extends GetAllTabletsState{
  String message;
  TabletError(this.message);
}
//*******************GetLastTabletsStates****************************************
abstract class GetLastTabletsState extends TabletState {}

class LastTabletInitial extends GetLastTabletsState {

}
class LastTabletLoading extends GetLastTabletsState{

}
class LastTabletLoaded extends GetLastTabletsState{
  List<Tablet> Tablets;
  LastTabletLoaded(this.Tablets);

}
class LastTabletError extends GetLastTabletsState{
  String message;
  LastTabletError(this.message);
}
//****************************************************************************
