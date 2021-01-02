import 'dart:convert';

import 'package:ecommerce/data/model/Laptop.dart';
import 'package:ecommerce/data/model/Mobile.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LaptopRerpository {
  Future<List<Laptop>>  getallLaptop();
  Future<List<Laptop>>  getLastLaptop();

}
class LaptopRerpositoryImpl extends LaptopRerpository{
  @override
  Future<List<Laptop>> getallLaptop()async{
    String token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String apiToken = prefs.getString('token');
    var header = {
      'Authorization': 'Bearer $apiToken',
    };
    Response respond=await get('http://10.0.2.2:8000/api/getAllLaptops',headers: header);
    if(respond.statusCode==200){
      List<Laptop> parsed=jsonDecode(respond.body)['data'].map<Laptop>((e){
        return Laptop.fromJson(e);
      }).toList();
      return parsed;
    }
    else{
      throw Exception('cant load laptops');
    }

  }


  @override
  Future<List<Laptop>> getLastLaptop()async{
    String token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String apiToken = prefs.getString('token');
    var header = {
      'Authorization': 'Bearer $apiToken',
    };
    Response respond=await get('http://10.0.2.2:8000/api/getLastLaptops',headers: header);
    if(respond.statusCode==200){
      List<Laptop> parsed=jsonDecode(respond.body)['data'].map<Laptop>((e){
        return Laptop.fromJson(e);
      }).toList();
      return parsed;
    }
    else{
      throw Exception('cant load laptops');
    }

  }

}
