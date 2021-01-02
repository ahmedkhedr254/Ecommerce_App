import 'package:ecommerce/UI/Streams/Streams.dart';
import 'package:ecommerce/UI/pages/MyDrawer.dart';
import 'package:ecommerce/UI/utilities/search.dart';
import 'package:ecommerce/UI/utilities/homePageUtilities.dart';
import 'package:ecommerce/bloc/laptop/laptop_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class homePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Color(0xffdfdddf),
        drawer: MyDrawer(context),
          appBar: AppBar(
            backgroundColor: Colors.purple,
           // leading: Icon(Icons.menu,size: 50,),
            title: Row(children: [ Icon(Icons.shopping_cart,size: 50,color: Colors.white,),Text('AMK Shop')],),
            actions: [
              IconButton(icon: Icon(Icons.search),onPressed: (){
                showSearch(context: context, delegate:search());
              },)
            ],
          ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text('    Newest Mobiles',style: TextStyle(fontSize: 22),),
                MobileStream()
             ,
              
              SizedBox(height: 30,),
              Text('    Newest Tablets',style: TextStyle(fontSize: 22),),
              TabletStream(),

              SizedBox(height: 30,),
              Text('    Newest Laptops',style: TextStyle(fontSize: 22),),
              SizedBox(height: 1,),
              LaptopStream(),

            ],
          ),
        ),
      );
  }

}

