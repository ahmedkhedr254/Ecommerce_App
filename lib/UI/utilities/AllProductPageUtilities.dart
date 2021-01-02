import 'package:ecommerce/UI/pages/ViewLaptop.dart';
import 'package:ecommerce/UI/pages/ViewTablet.dart';
import 'package:ecommerce/UI/pages/viewMobile.dart';
import 'package:ecommerce/data/model/Mobile.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/data/model/Laptop.dart';

Widget AllProductGrid(products,context){
  double height=MediaQuery.of(context).size.height;
  double width=MediaQuery.of(context).size.width;

    return Container(
      height:height*80/100,
      padding: EdgeInsets.all(10),
      child:  GridView.count(
        childAspectRatio: (width*50/100)/(height*30/100),
        primary: false,
        //padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children:products.map<Widget>((e) => GridCard(e,context)).toList(),
      ),
    );
}


Widget GridCard(e,context) {

  String imagePath = "http://10.0.2.2:8000/" + e.image;
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
          border: Border.all(
            color:Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: FlatButton(
        onPressed: (){
          if (e is Mobile){
            Navigator.push(context,
                MaterialPageRoute(builder: (context){return ViewMobile(e);})
            );
          }
          else if (e is Laptop){
            Navigator.push(context,
                MaterialPageRoute(builder: (context){return ViewLaptop(e);})
            );
          }
          else{
            Navigator.push(context,
                MaterialPageRoute(builder: (context){return ViewTablet(e);})
            );
          }
        },
        padding: EdgeInsets.all(0),
        child: Column(

            children: [
              Text(e.name,style: TextStyle(color: Colors.black,fontSize: 22)),



                  Container(
                    width:500,
                    height: height * 15 / 100,
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(imagePath, scale: 1),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
               Center(child: Text(e.price.toString()+"\$",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 22),),),
            ],
          ),

      ),

  );
}
