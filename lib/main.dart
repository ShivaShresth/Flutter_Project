import 'package:firstproject/NewsProvider/provider_user_service.dart';
import 'package:firstproject/model/authService.dart';
import 'package:firstproject/model/repositery.dart';
import 'package:firstproject/second.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

void main() {
  runApp(
    
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>UserProivder()),
      ChangeNotifierProvider(create: (context)=>NewsProvider()),
    ],
      
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
 final LoginServices login=LoginServices();
 
  @override
  void initState() {
    login.getUserData(context)
    ;
    // TODO: implement initState
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<UserProivder>(context).user;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
   
        primarySwatch: Colors.blue,
      ),
      home:Provider.of<UserProivder>(context).user.token.isNotEmpty?SecondScreen(userModel: user):HomePage()
    );
  }
}


