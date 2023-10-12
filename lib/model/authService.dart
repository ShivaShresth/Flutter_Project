import 'dart:convert';

import 'package:firstproject/model/usermode.dart';
import 'package:flutter/material.dart';

class UserProivder with ChangeNotifier{  
  UserModel _user=UserModel(
    id: 0, 
    token: '', 
    email: '',
     phonenumber: '', 
     username: '');

     UserModel get user=>_user;

     void setUser(String user){  
      _user=UserModel.fromJson(jsonDecode(user));
      notifyListeners();
     }

     void setUserFromModel(UserModel user){  
_user=user;
notifyListeners();
     }

}