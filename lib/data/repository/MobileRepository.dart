import 'dart:convert';

import 'package:ecommerce/data/model/Mobile.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MobileRerpository {
  Future<List<Mobile>>  getallMobile();
  Future<List<Mobile>>  getLastMobile();

}
class MobileRerpositoryImpl extends MobileRerpository{
  @override
  Future<List<Mobile>> getallMobile()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String apiToken = prefs.getString('token');
    var header = {
      'Authorization': 'Bearer $apiToken',
    };
      Response respond=await get('http://10.0.2.2:8000/api/getAllMobiles',headers: header);
      if(respond.statusCode==200){
        List<Mobile> parsed=jsonDecode(respond.body)['data'].map<Mobile>((e){
          return Mobile.fromJson(e);
        }).toList();
        return parsed;
      }
      else{
        throw Exception('cant load mobiles');
      }


  }

  @override
  Future<List<Mobile>> getLastMobile()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String apiToken = prefs.getString('token');
    var header = {
      'Authorization': 'Bearer $apiToken',
    };
    Response respond=await get('http://10.0.2.2:8000/api/getLastMobiles',headers: header);
    if(respond.statusCode==200){
      List<Mobile> parsed=jsonDecode(respond.body)['data'].map<Mobile>((e){
        return Mobile.fromJson(e);
      }).toList();
      return parsed;
    }
    else{
      throw Exception('cant load mobiles');
    }


  }

}
