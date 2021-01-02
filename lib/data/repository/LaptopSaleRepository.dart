import 'dart:convert';

import 'package:ecommerce/data/model/LaptopSale.dart';
import 'package:http/http.dart';
String token='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODk2MzhlOTRhNzE0Nzk3NGM1ZjQ0OTczNzU2YWU4MGUxNTg0MjUwMWZmZDA5MWFjZWExM2E2MWRkMTVkZTE1NmM3MjZmZDY5YjhiNDFmNjciLCJpYXQiOiIxNjA3ODA2ODA2Ljc4ODk0NCIsIm5iZiI6IjE2MDc4MDY4MDYuNzg4OTUwIiwiZXhwIjoiMTYzOTM0MjgwNi43MzMzODQiLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.o-P_VxZOiRDwkqUHSRpsWoS6ENTfLrRGWO4p2ltRQfZGfHHheZVIgnFFqXX30Q9zqgmIknqv0wzE-8cC9r2xIZh-OZJyJYdDZqjiJDX_bZiOptTHmj_QrV_aNqQRXUvzDk63nIShFasjuTdle5KMKNR-QD37-ow6RiNToinHO-1lab_qkGIGbz-Ibsejwk7QFdFT6qxAqySgJ6FR0RwVW9-SnGPG--j_TR8S5SE5m8XhBoczKjGAfOGOCkAmZmJyiZa1FDui4SUAnZB20uJl0bP5d4WMuS3aGHeISE3csy_yF91M3zN5uZ-UJjepu3FeatX4bLqDJfHuQE6Xg1BTF0YJ9BGDIakI4jxB7lgPFgoIgEyrFw2h9rXQabJ5_h_wIXRoKojqKn2Nsze2P_EiLEI14z8qBQKRhI29yqr1xgQgAYS-WRnfr_a2LHzknHdD9qsgLROp_G7O7YG4QukiPN1SHgk4Y10StU00_vOgS6enu8oNDuR1-hyjCtxv3nenmEn4qqOt60RZ8EC4ioba4ZoYDy6zkVF14-4Ax9Qoh4abIFSq9241Mb_L2gCx6BXH_GkSXM3sE8X5nVeS-zS6wDmNmS7V-afR_awV5Hfo07yl6TUvjScTLZoWwHO87QJpYqE0BKAU2KfeYwnKS2na7V-NALKvk91KC1YHo4VT5OA';


abstract class LaptopSaleRepository{
 Future<List<LaptopSale>> getLaptopSales();
 Future<bool>addLaptopSales(String laptop_id);
}

class LaptopSaleRepositoryImpl extends LaptopSaleRepository{
  @override
  Future<List<LaptopSale>> getLaptopSales()async {
      var header = {
      'Authorization': 'Bearer $token',
      };
     Response respond=await get('http://10.0.2.2:8000/api/getUserLaptopSales',headers: header);
     if(respond.statusCode==200){
        List<LaptopSale> parsed=jsonDecode(respond.body)['data'].map<LaptopSale>((e){
         return LaptopSale.fromJson(e);
        }).toList();
        return parsed;
     }
     else{
        throw Exception('cant load LaptopSales');
     }
  }

  @override
  Future<bool> addLaptopSales(String laptop_id)async {
    var header = {
      'Authorization': 'Bearer $token',
    };
    var body={'laptop_id':laptop_id};
    Response respond=await post('http://10.0.2.2:8000/api/buyLaptop',headers: header);
    if(respond.statusCode==200){
      return true;
    }
    else{
      throw Exception('cant add LaptopSales');
    }
  }




}
