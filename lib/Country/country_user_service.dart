import 'dart:convert';

import 'package:firstproject/Country/counrty_service_model.dart';
import 'package:firstproject/Gender/gender_service_model.dart';
import 'package:firstproject/mario/mario_service_model.dart';
import 'package:firstproject/model/user_services_model.dart';
import 'package:firstproject/snackbarutils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// String uri = "https://api.nationalize.io/?name=kishor";
// //String uri2="https://jsonplaceholder.typicode.com/albums";
// String uri="https://api.genderize.io/?name=";
class CountryUserServices {
  Future<List<dynamic>> getUserData({
    required BuildContext context,
    required String data,
  }) async {
    try {
      http.Response res = await http.get(Uri.parse("https://api.nationalize.io/?name=$data"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
                    print(res.body);
                              print(jsonDecode(res.body)['country']);

      //if (jsonDecode(res.body)['gender']!=null) 

   if(jsonDecode(res.body)['name']!=null){  
    return[ true,nameServiceModelFromJson(res.body)];
   }else{  

    return [false];
   }
    } catch (e) {
      SnackbarUtils.showMessage(context: context, message: e.toString());
   return [false];
    }
   // return userData;
  }
}
