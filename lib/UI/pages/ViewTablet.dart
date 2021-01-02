import 'package:date_format/date_format.dart';
import 'package:ecommerce/data/model/Tablet.dart';
import 'package:flutter/material.dart';

import 'WebViewPage.dart';

class ViewTablet extends StatelessWidget {
  final Tablet myTablet;

  ViewTablet(this.myTablet);
  Widget infoRow(String property,String value,double width){
    return Padding(
      padding: EdgeInsets.all(width*5/100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(width: width*2/100,),
          Text(property,style: TextStyle(fontSize: 25),),

          Text(value,style: TextStyle(fontSize: 18,color: Colors.purple),),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    String imagePath = "http://10.0.2.2:8000/" + myTablet.image;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Use the Todo to create the UI.
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            "Product Details",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shopping_cart,color: Colors.white,),
          backgroundColor: Colors.purple,
          onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context){
              return WebViewExample(myTablet.price.toString());
            }));
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*2/100,),
            Row(
              children: [
                SizedBox(width: width*1/100,),
                Text('Dell Inspiron 3593',style: TextStyle(color:Colors.black,fontSize: 28,fontWeight: FontWeight.bold),),
                SizedBox(width: width*22/100,),
                Text(myTablet.price.toString()+"\$",style: TextStyle(color: Colors.red,fontSize: 25 ,fontWeight: FontWeight.bold),),

              ],
            ),
            SizedBox(height: height*2/100,),
            Container(
              child: Image.network(
                imagePath,
                width: width,
                height: height * 20 / 100,
              ),
              color: Colors.white,
            ),
            SizedBox(height: height*1/100,),
            Padding(padding: EdgeInsets.only(left: width*2/100),child: Text('Description',style: TextStyle(color: Colors.purple,fontSize: 28),),),
            Padding(padding:EdgeInsets.all(width*2/100),child: Text("Acer Aspire 5 A515-43-R19L comes with these high level specs: AMD Ryzen 3 3200U Dual-Core Processor 2.6GHz with Precision Boost")),
            //list of properties scrollable
            Padding(padding: EdgeInsets.only(left: width*2/100),child: Text('Product information',style: TextStyle(color: Colors.purple,fontSize: 28),),),
            Container(
              width: width,height: height*33/100,color: Colors.white,
              child: ListView(
                children: [
                  infoRow("Camera","15Mpx",width),
                  Container(width: width,height: 1,color: Colors.black45,),
                  infoRow("Ram","15GB",width),
                  Container(width: width,height: 1,color: Colors.black45,),
                  infoRow("CPU","core i5",width),
                  Container(width: width,height: 1,color: Colors.black45,),
                  infoRow("GPU","nividia",width),
                  Container(width: width,height: 1,color: Colors.black45,),
                  infoRow("Strorage","1TB",width),
                  Container(width: width,height: 1,color: Colors.black45,),
                ],
              ),)

          ],
        ));
  }
}

