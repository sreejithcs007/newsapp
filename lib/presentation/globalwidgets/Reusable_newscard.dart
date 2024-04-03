import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class NewsCard extends StatelessWidget{
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final String url;

  NewsCard({required this.author,required this.title, required this.description,required this.urlToImage,
    required this.publishedAt, required this.content,required this.url
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,),),
        ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.3,
              width: double.infinity,
              child: CachedNetworkImage(imageUrl: urlToImage,fit: BoxFit.cover,
              placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Image(image: AssetImage("asset/image/notfound.png"),fit: BoxFit.cover,),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,top: 15),
              child: Text(title ,style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20,),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(description  , style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 15,),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(author, style:TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15,color: Colors.brown) ,),
                  Text(publishedAt != null
                      ? DateFormat('yyyy-MM-dd ').format(
                    DateTime.parse(publishedAt.toString())) : "",style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 15,color: Colors.grey),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(content,style: TextStyle(fontSize: 15,color: Colors.black),),
            )

            
          ],
        ),
      ),
    );
  }

}