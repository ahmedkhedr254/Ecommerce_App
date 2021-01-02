import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/UI/pages/ViewLaptop.dart';
import 'package:ecommerce/UI/pages/ViewTablet.dart';
import 'package:ecommerce/UI/pages/test.dart';
import 'package:ecommerce/UI/pages/viewMobile.dart';
import 'package:ecommerce/data/model/Laptop.dart';
import 'package:ecommerce/data/model/Mobile.dart';
import 'package:ecommerce/data/model/Tablet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget LaptopSlider(List<Laptop> laptops, context) {
  return CarouselSlider(
      items: laptops.map((e) => SliderCard(e, context)).toList(),
      options: CarouselOptions(
        disableCenter: true,
        enlargeCenterPage: false,
        viewportFraction: 0.4,
        autoPlay: true,
        height: MediaQuery.of(context).size.height * 22 / 100,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
      ));
}

Widget MobileSlider(List<Mobile> laptops, context) {
  return CarouselSlider(
      items: laptops.map((e) => SliderCard(e, context)).toList(),
      options: CarouselOptions(
        disableCenter: true,
        enlargeCenterPage: false,
        viewportFraction: 0.4,
        autoPlay: true,
        height: MediaQuery.of(context).size.height * 22 / 100,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
      ));
}

Widget TabletSlider(List<Tablet> laptops, context) {
  return CarouselSlider(
      items: laptops.map((e) => SliderCard(e, context)).toList(),
      options: CarouselOptions(
        disableCenter: true,
        enlargeCenterPage: false,
        viewportFraction: 0.4,
        autoPlay: true,
        height: MediaQuery.of(context).size.height * 22 / 100,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
      ));
}

Widget SliderCard(e, context) {
  String imagePath = "http://10.0.2.2:8000/" + e.image;
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return FlatButton(
      onPressed: () {
        if (e is Mobile) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ViewMobile(e);
          }));
        } else if (e is Laptop) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ViewLaptop(e);
          }));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ViewTablet(e);
          }));
        }
      },
      padding: EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color:Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        margin: EdgeInsets.all(6.0),
        child: Column(

          children: [
            Text(e.name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  width: width * 70 / 100,
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
                Container(
                  width: width * 70 / 100,
                  height: height*3/100,
                  color: Colors.white.withOpacity(.9),
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.all(6.0),
                  child: Center(child: Text(e.price.toString()+"\$",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),),
                ),
              ],
            ),
          ],
        ),
      ));
}
