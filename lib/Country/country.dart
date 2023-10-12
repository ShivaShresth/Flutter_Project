import 'package:firstproject/Country/counrty_service_model.dart';
import 'package:firstproject/Country/country_user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CountryName extends StatefulWidget {
  const CountryName({super.key});

  @override
  State<CountryName> createState() => _CountryNameState();
}

class _CountryNameState extends State<CountryName> {
  CountryUserServices countryUserServices=CountryUserServices();
  List<NameServiceModel> dataa=[];
  List<Country> countryData=[];
  late NameServiceModel nameServiceModel;
  

  TextEditingController text1=TextEditingController();


  void getDatas()async{ 
    final dataa=await countryUserServices.getUserData(context: context, data: text1.text); 
    print("country$dataa");
    if(dataa[0]){   
      nameServiceModel=dataa[1];
      countryData=nameServiceModel.country;
      setState(() {
        
      });
    }


  }
@override
  void initState() {
    getDatas();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(   
      title: Text("Counter Name"),
      ),

      body: Column(  
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
      MaterialButton(
        minWidth: double.infinity,
        color: Colors.blue,
        onPressed:(){
          getDatas();  

      },child: Text("submit"),
      
      ),


      Expanded(
        child: ListView.builder(
          itemCount:countryData.length ,
          itemBuilder: (context,index){  
            final note=countryData[index];
            double a=note.probability;
      
            return Column(  
              children: [  
                Text(note.countryId),
                Text("$a"),
              
              ],
            );
          }),
      )
        ],
      ),



    );
  }
}