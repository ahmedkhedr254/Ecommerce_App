import 'package:ecommerce/UI/Streams/Streams.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*this page may view 3 types of product if you pass to it "mob" it will return grid of all
mobiles and if you pass to it "tab "  it will return grid of all tablets etc...*/
//NOTE:: pefore open this page using navogator you have to add GetAllMobiles or GetAllLaptops or GetAllTablets event to the block it depent on what the type of products which u want to view
class ViewAllProduct extends StatelessWidget {
  String type;
  ViewAllProduct(this.type);

  Widget determineWhichProduct(String type){
    if(type=="mob"){
      return AllMobileStream();
    }
    else if (type=="tab"){
      return AllTabletStream();
    }
    else{
        return AllLaptopStream();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdfdddf),
        appBar: AppBar(backgroundColor: Colors.purple,),
        body:Container(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.width*3/100,),
            Container(margin: EdgeInsets.only(left: 20),child: Text('Mobile Products',style: TextStyle(fontSize: 28,fontWeight:FontWeight.bold),)),
            determineWhichProduct(this.type)
          ],),
        )
    );
  }
}
