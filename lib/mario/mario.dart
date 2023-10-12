import 'package:firstproject/mario/mario_service_model.dart';
import 'package:firstproject/mario/mario_user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MarioScreen extends StatefulWidget {
  const MarioScreen({super.key});

  @override
  State<MarioScreen> createState() => _MarioScreenState();
}

class _MarioScreenState extends State<MarioScreen> {
  MarioUserServices marioUserServices=MarioUserServices();
late MarioServiceModel marioServiceModel;
 List<Amiibo> amiibo=[];


  
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      appBar: AppBar(  
        title: Text("Mario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(   
          children: [  
            Expanded(
              child: FutureBuilder(
                future:marioUserServices.getUserData(context: context),
                builder: (context,AsyncSnapshot snapshot){  
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(  
                      child: CircularProgressIndicator(),
                    );
                  }else if(snapshot.hasError){ 
                    return Center(  
                      child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){ 
                    marioServiceModel= snapshot.data;
                    amiibo = marioServiceModel.amiibo;
                    print("lengthd id ${amiibo.length}");
                    return ListView.builder(
                      itemCount: amiibo.length,
                      itemBuilder: (context,index){  
                        final datas=amiibo[index];
                        print("The name is ${datas.character}");
                        return Card( 
                          elevation: 6,
                          margin: EdgeInsets.symmetric(vertical: 10), 
                          child: Column(  
                            children: [  
                              Row(  
                                children: [  
                                
                              Image.network(datas.image,height: 200,width: 200,),

                              Text(datas.name),

                                ],
                              )
                            ],
                          ),
                        );
                      });
                  }else{  
                    return Text("No Data Avaliable");
                  }
                
                }
                ),
            )
          ],
        ),
      ),
















    );
  }
}