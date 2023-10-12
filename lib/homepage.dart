import 'package:firstproject/model/authService.dart';
import 'package:firstproject/model/repositery.dart';
import 'package:firstproject/snackbarutils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();

final LoginServices loginServices=LoginServices();

void login(){  
  loginServices.login(context: context, email: text1.text, password: text2.text);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              
        Image.network("https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",height: 300,width: 300,),
        
              TextFormField(
                controller: text1,
                
                decoration: InputDecoration( 
                  border: OutlineInputBorder(  
                    borderSide: BorderSide(  
                      color: Colors.red,
                      
                    )
                  ),
                  hintText: "Enter Email"
                ),
                
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                controller: text2,
                decoration: InputDecoration( 
                  border: OutlineInputBorder(  
                    borderSide: BorderSide(  
                      color: Colors.red
                    )
                  ), 
                  hintText: "Enter Password"
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  if(text1.text==""&& text2.text==""){ 
                    SnackbarUtils.showMessage(context: context, message: "Please All Enter the required field"); 

                  }else if(text2.text.length<5){  
               SnackbarUtils.showMessage(context: context, message: "Please Enter the longer password"); 

                  }
                  
                  else{  
                  login();

                  }
                },
                child: Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
