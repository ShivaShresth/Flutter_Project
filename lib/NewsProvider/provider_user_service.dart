import 'dart:convert';

import 'package:firstproject/News/news_service_model.dart';
import 'package:firstproject/mario/mario_service_model.dart';
import 'package:firstproject/model/user_services_model.dart';
import 'package:firstproject/snackbarutils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String uri = "https://www.consultancynepal.com/api";



class NewsProvider extends ChangeNotifier {
      List<NewsServiceModel> newsData = [];
bool hasError=false;
  Future<void> getNewsData({
    required BuildContext context,
  }) async {
    try {
      http.Response res = await http.get(Uri.parse('$uri/news.php'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      if (res.statusCode == 200) {
        newsData.clear();
   newsData=  newsServiceModelFromJson(res.body);
   notifyListeners();
      }else{  
        hasError=true;
        notifyListeners();
      }
    } catch (e) {
      hasError=true;
      notifyListeners();
      SnackbarUtils.showMessage(context: context, message: e.toString());
    }
   // return userData;
  }
}
