import 'dart:convert';

import 'package:firstproject/Gender/gender_service_model.dart';
import 'package:firstproject/mario/mario_service_model.dart';
import 'package:firstproject/model/user_services_model.dart';
import 'package:firstproject/snackbarutils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// String uri = "https://www.amiiboapi.com/api/amiibo/?name=mario";
// //String uri2="https://jsonplaceholder.typicode.com/albums";
// String uri="https://api.genderize.io/?name=";
class GenderUserServices {
  Future<List<dynamic>> getUserData({
    required BuildContext context,
    required String data,
  }) async {
    try {
      http.Response res = await http.get(Uri.parse("https://api.genderize.io/?name=$data"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
          print(res.body);
          print(jsonDecode(res.body)['gender']);
      if (jsonDecode(res.body)['gender']!=null) {
        return  [true,genderServiceModelFromJson(res.body)];
      }else{   
        return[false];
      }
    } catch (e) {
      SnackbarUtils.showMessage(context: context, message: e.toString());
      return [false];
    }
   // return userData;
  }
}
