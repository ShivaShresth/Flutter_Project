import 'package:firstproject/NewsProvider/provider_user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../News/news_service_model.dart';
import '../News/news_user_service.dart';
import '../News/newspage.dart';

class NewsProviderScreen extends StatefulWidget {
  const NewsProviderScreen({super.key});

  @override
  State<NewsProviderScreen> createState() => _NewsProviderScreenState();
}

class _NewsProviderScreenState extends State<NewsProviderScreen> {

  NewsUserServices newsUserServices = NewsUserServices();
  late NewsServiceModel newsServiceModel;
  List<NewsServiceModel> userDatas = [];

  @override
  Widget build(BuildContext context) {
     ScrollController scrollController=ScrollController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(  
          children: [  
            Icon(Icons.location_city_outlined),
            Text("Nepal",style:TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(width: 8,),
            Text("Consultancy Nepal",style: TextStyle(fontWeight: FontWeight.w400),)
          ],
        ),
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Consumer<NewsProvider>(
                builder: (context, newsProivder,child) {
              if(newsProivder.newsData.isEmpty&&!newsProivder.hasError){   
                newsProivder.getNewsData(context: context);
                return Center(child: CircularProgressIndicator(),);
              }else if(newsProivder.hasError){  
                return Center(child:Text("No news Avaliable"));
              }else{  
                 userDatas = newsProivder.newsData;
      
                    return Scrollbar(
                      controller: scrollController,
                      child: ListView.builder(
                          itemCount: userDatas.length,
                          itemBuilder: (context, index) {
                            final note = userDatas[index];
                                      
                            return GestureDetector(
                              onTap: (){  
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsPage(title: note.title, date: note.date, image: note.image, description: note.description)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 6,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Row(
                                        //   children: [
                                        //     Text(
                                        //       "Publication Date:",
                                        //       style: TextStyle(
                                        //           color: Colors.red,
                                        //           fontWeight: FontWeight.bold),
                                        //     ),
                                        //     Text(
                                        //       "${note.date}",
                                        //     ),
                                        //   ],
                                        // ),
                                         RichText(text: TextSpan(   
                    children: [  
                      TextSpan(    
                        text: "Publicationss Date:",style: TextStyle(color: Colors.red),
                      ),TextSpan(  
                        text: "${note.date}"
                      )
      
                    ]
                  )),
                                        SizedBox(height: 10,),
                                        Text("${note.title}",
                                        textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                                                                  SizedBox(height: 10,),
                                        
                                        Text("${note.description}",
                                        textAlign: TextAlign.justify,
                                        
                                        maxLines:1,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
              }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}