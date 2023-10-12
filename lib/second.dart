import 'package:firstproject/Country/country.dart';
import 'package:firstproject/Gender/gender_service_model.dart';
import 'package:firstproject/Gender/gender_user_service.dart';
import 'package:firstproject/Gender/genderpage.dart';
import 'package:firstproject/News/news.dart';
import 'package:firstproject/NewsProvider/provider.dart';
import 'package:firstproject/TapEffect/tap_effect.dart';
import 'package:firstproject/UserScreen/userscreen.dart';
import 'package:firstproject/mario/mario.dart';
import 'package:firstproject/model/usermode.dart';
import 'package:firstproject/user_service/user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import 'model/authService.dart';

class SecondScreen extends StatefulWidget {
  final UserModel userModel;
  const SecondScreen({super.key, required this.userModel});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  GenderUserServices genderUserServices = GenderUserServices();
  late GenderServiceModel genderServiceModel;
  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<UserProivder>(context).user.username;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userModel.username),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,bottom: 60,top: 60,right: 20),
        child: Container(
          color: Colors.black,
          height: double.infinity,
          child: Padding(
            
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
            child: Container(
              
              height: 500,
              
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(userName),
                    TapEffect(
                      child: MaterialButton(
                        minWidth: double.infinity,
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserDetailsScreens()));
                        },
                        child: Text("User Detail"),
                      ),
                    ),
                    TapEffect(
                      child: MaterialButton(
                        minWidth: double.infinity,
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MarioScreen()));
                        },
                        child: Text("Mario Screens"),
                      ),
                    ),
                    TapEffect(
                      child: MaterialButton(
                        minWidth: double.infinity,
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => NewsScreen()));
                        },
                        child: Text("News"),
                      ),
                    ),
                    //  MaterialButton(
                    //   color: Colors.blue,
                    //   onPressed: (){
                    //     genderUserServices.getUserData(context: context, data: "1234");
                      
                    //   },child: Text("Data"),
                      
                    // ),
                      
                    TapEffect(
                      child: MaterialButton(
                        minWidth: double.infinity,
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => GenderPage()));
                        },
                        child: Text("Gender"),
                      ),
                    ),
                      
                    TapEffect(
                      child: MaterialButton(
                        minWidth: double.infinity,
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CountryName()));
                        },
                        child: Text("Country Name"),
                      ),
                    ),
                     
                    TapEffect(
                      child: MaterialButton(
                        minWidth: double.infinity,
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => NewsProviderScreen()));
                        },
                        child: Text("Provider News"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
