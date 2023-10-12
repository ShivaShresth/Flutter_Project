


import 'dart:convert';

import 'package:firstproject/model/authService.dart';
import 'package:firstproject/model/usermode.dart';
import 'package:firstproject/second.dart';
import 'package:firstproject/snackbarutils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String uri = "https://www.consultancynepal.com/api";



class LoginServices{   
  void login({
  required BuildContext context, 
  required String email, 
  required  password})
  async{
    try{  
      http.Response res =await http.post(  
        Uri.parse('$uri/login.php'),
        body:jsonEncode({'email':email,'password':password}),
        headers: <String,String>{  
          'Content-Type':'application/json; charset=UTF-8'
        }
      );
      if(res.statusCode==200){ 
        SharedPreferences prefs=await SharedPreferences.getInstance();
        Provider.of<UserProivder>(context,listen:false).setUser(res.body);
        await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
        print(prefs.getString('x-auth-token'));
         Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen(
          userModel: userModelFromJson(res.body),
         )));

      }else if(res.statusCode==400){  
        SnackbarUtils.showMessage(context: context, message: jsonDecode(res.body)['msg']);

      }else{  
                SnackbarUtils.showMessage(context: context, message: "Failed to login");

      }
    }catch( e){  
                SnackbarUtils.showMessage(context: context, message: e.toString());

    }



  }
  void getUserData(BuildContext context)async{  
    try{  
      SharedPreferences prefs=await SharedPreferences.getInstance();
      String? token=prefs.getString('x-auth-token');
      if(token==null){ 
        prefs.setString('x-auth-token', "");
      }
      var tokenRes=await http.post(Uri.parse('$uri/get_user_data.php'),  
      headers: <String,String>{  
        'Content-Type':"application/json; charset=UTF-8",
        "x-auth-token":token!
      }
      );
      print(tokenRes.body);
      if(tokenRes.statusCode==200){  
        var userProvider=Provider.of<UserProivder>(context,listen: false);
        userProvider.setUser(tokenRes.body);
      }
    }catch(e){  
      print("Program failed get user data on catch");
      SnackbarUtils.showMessage(context: context, message: e.toString());
    }
  }


}