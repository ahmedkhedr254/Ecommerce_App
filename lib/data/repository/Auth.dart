import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
   login(String email, String password) async {
    var body = {'email': email, 'password': password};
     Response respond = await post('http://10.0.2.2:8000/api/login', body: body);
    return jsonDecode( respond.body);
  }

   register(name,email,password,phone,country,city,street,home_num,birthday)async {
     //DateTime Datebirthday = DateTime.parse(birthday);

     var body = {
    'name' :name,
     'email' :email,
     'password' :password,
     'phone' :phone,
    'country' : country,
     'city' : city,
     'street' : street,
     'home_num' : home_num,
    'birthday' : birthday,
    };
     Response respond = await post('http://10.0.2.2:8000/api/register', body: body);
     print(respond.body);
    return jsonDecode( respond.body);
  }

  Future<bool> logout()async {
     String token;
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String apiToken = prefs.getString('token');
    var header = {
      'Authorization': 'Bearer $apiToken',
    };
    Response respond = await get('http://10.0.2.2:8000/api/logout',headers: header);
    return jsonDecode( respond.body)['state'];
  }
}
