import 'dart:convert';

import 'package:firstproject/model/user_services_model.dart';
import 'package:firstproject/snackbarutils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String uri = "https://jsonplaceholder.typicode.com/users";
//String uri2="https://jsonplaceholder.typicode.com/albums";

class UserServices {
  Future<List<UserServiceModel>> getUserData({
    required BuildContext context,
  }) async {
    List<UserServiceModel> userData = [];
    try {
      http.Response res = await http.get(Uri.parse('$uri'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      if (res.statusCode == 200) {
        userData = userServiceModelFromJson(res.body);
      }
    } catch (e) {
      SnackbarUtils.showMessage(context: context, message: e.toString());
    }
    return userData;
  }
}
