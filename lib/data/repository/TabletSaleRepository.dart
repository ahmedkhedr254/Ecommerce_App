import 'dart:convert';

import 'package:ecommerce/data/model/TabletSale.dart';
import 'package:http/http.dart';
String token='eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiODk2MzhlOTRhNzE0Nzk3NGM1ZjQ0OTczNzU2YWU4MGUxNTg0MjUwMWZmZDA5MWFjZWExM2E2MWRkMTVkZTE1NmM3MjZmZDY5YjhiNDFmNjciLCJpYXQiOiIxNjA3ODA2ODA2Ljc4ODk0NCIsIm5iZiI6IjE2MDc4MDY4MDYuNzg4OTUwIiwiZXhwIjoiMTYzOTM0MjgwNi43MzMzODQiLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.o-P_VxZOiRDwkqUHSRpsWoS6ENTfLrRGWO4p2ltRQfZGfHHheZVIgnFFqXX30Q9zqgmIknqv0wzE-8cC9r2xIZh-OZJyJYdDZqjiJDX_bZiOptTHmj_QrV_aNqQRXUvzDk63nIShFasjuTdle5KMKNR-QD37-ow6RiNToinHO-1lab_qkGIGbz-Ibsejwk7QFdFT6qxAqySgJ6FR0RwVW9-SnGPG--j_TR8S5SE5m8XhBoczKjGAfOGOCkAmZmJyiZa1FDui4SUAnZB20uJl0bP5d4WMuS3aGHeISE3csy_yF91M3zN5uZ-UJjepu3FeatX4bLqDJfHuQE6Xg1BTF0YJ9BGDIakI4jxB7lgPFgoIgEyrFw2h9rXQabJ5_h_wIXRoKojqKn2Nsze2P_EiLEI14z8qBQKRhI29yqr1xgQgAYS-WRnfr_a2LHzknHdD9qsgLROp_G7O7YG4QukiPN1SHgk4Y10StU00_vOgS6enu8oNDuR1-hyjCtxv3nenmEn4qqOt60RZ8EC4ioba4ZoYDy6zkVF14-4Ax9Qoh4abIFSq9241Mb_L2gCx6BXH_GkSXM3sE8X5nVeS-zS6wDmNmS7V-afR_awV5Hfo07yl6TUvjScTLZoWwHO87QJpYqE0BKAU2KfeYwnKS2na7V-NALKvk91KC1YHo4VT5OA';


abstract class TabletSaleRepository{
  Future<List<TabletSale>> getTabletSales();
  Future<bool>addTabletSales(String Tablet_id);
}

class TabletSaleRepositoryImpl extends TabletSaleRepository{
  @override
  Future<List<TabletSale>> getTabletSales()async {
    var header = {
      'Authorization': 'Bearer $token',
    };
    Response respond=await get('http://10.0.2.2:8000/api/getUserTabletSales',headers: header);
    if(respond.statusCode==200){
      List<TabletSale> parsed=jsonDecode(respond.body)['data'].map<TabletSale>((e){
        return TabletSale.fromJson(e);
      }).toList();
      return parsed;
    }
    else{
      throw Exception('cant load TabletSales');
    }
  }

  @override
  Future<bool> addTabletSales(String tablet_id)async {
    var header = {
      'Authorization': 'Bearer $token',
    };
    var body={'tablet_id':tablet_id};
    Response respond=await post('http://10.0.2.2:8000/api/buyTablet',headers: header);
    if(respond.statusCode==200){
      return true;
    }
    else{
      throw Exception('cant add TabletSales');
    }
  }




}
