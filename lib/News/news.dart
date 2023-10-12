import 'package:firstproject/News/news_service_model.dart';
import 'package:firstproject/News/news_user_service.dart';
import 'package:firstproject/News/newspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsUserServices newsUserServices = NewsUserServices();
  late NewsServiceModel newsServiceModel;
  List<NewsServiceModel> userDatas = [];

  @override
  Widget build(BuildContext context) {
     ScrollController scrollController=ScrollController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
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
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: newsUserServices.getUserData(context: context),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  userDatas = snapshot.data;

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
                    ),
                    //vommrnt sdddrd

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
                } else {
                  return Text("No Data Avaliable");
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
