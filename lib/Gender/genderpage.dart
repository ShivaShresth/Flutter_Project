import 'package:firstproject/Gender/gender_service_model.dart';
import 'package:firstproject/snackbarutils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'gender_user_service.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
    GenderUserServices genderUserServices=GenderUserServices();
    String gender="";
    late GenderServiceModel genderServiceModel;
    bool isLoading=false;

TextEditingController text1=TextEditingController();
void getDatas()async{ 
  setState(() {
    isLoading=true;
  }); 
 final data=await genderUserServices.getUserData(context: context, data:text1.text);

if(data[0]){ 
   genderServiceModel=data[1];
  setState(() {
    gender=genderServiceModel.gender;
    isLoading=false;
  });
}else{  
  setState(() {
    gender="";
    isLoading=false;
  });
  SnackbarUtils.showMessage(context: context, message: "Enter the valide name");
}

}



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(  
        title: Text("Gender Finder"),
      ),
body: Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Column(  
  
    children: [ 
     
  
      TextField( 
        controller: text1,
         
  
        decoration: InputDecoration( 
          border: OutlineInputBorder(  
          
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(  
              color: Colors.green,
              style: BorderStyle.solid,
            ),
            
          ), 
          

prefixIcon: Icon(Icons.person),
hintText: "Enter name"
  
        ),
  
      ),
      SizedBox(height: 50,),
      MaterialButton(
        minWidth: double.infinity,
        color: Colors.blue,
        onPressed: ()=>isLoading?null:getDatas(),child: isLoading?Center(child: CircularProgressIndicator(
          color: Colors.white,
        )): Text("Submit"),),


    gender.isEmpty?Container():Text(genderServiceModel.gender),

       gender.isEmpty?Container():Image.network(gender=="male"?"https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg":"https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80"),


  
    ],
  ),
),

    );
  }
}