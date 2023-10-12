// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NewsPage extends StatefulWidget {
  final String title;
  final String date;
  final String image;
  final String description;
  const NewsPage({
    Key? key,
    required this.title,
    required this.date,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  ScrollController scrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(  
        backgroundColor: Colors.red,
        title: Text("News"),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,),onPressed: (){ Navigator.pop(context);},)
      ),
      body: Scrollbar(
        controller: scrollController,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(  
              children: [  
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(widget.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(right: 90),
                  child: Row(  
                    children: [  
                  Text("Publication Date:",style: TextStyle(color: Colors.red),),
                  Text("${widget.date}")
                
                    ],
                  ),
                ),



               
                                SizedBox(height: 6,),
                                
          CachedNetworkImage(
        imageUrl: widget.image,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
     ),
          
                          SizedBox(height: 6,),
          
             Text("${widget.description}",style: TextStyle(fontSize: 17),)
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}