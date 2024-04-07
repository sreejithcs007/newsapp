import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tasknews/presentation/favourite_screen/controller/favourite_screen_controller.dart';

import '../../globalwidgets/Reusable_newscard.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    Provider.of<FavouriteController>(context, listen: false).getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<FavouriteController>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        title: Text("Favourites",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body:
      
      ListView.builder(
          itemCount: prov.favourit.length,
          itemBuilder: (context, index) {
            print(" image : ${prov.favourit[index].urlToImage.toString()}");

            return InkWell(
              onTap: () {
                var auth = prov.favourit[index].author.toString() ;
                var title = prov.favourit[index].title.toString() ;
                var descr = prov.favourit[index].description.toString();
                var img = prov.favourit[index].urlToImage.toString();
                var pub = prov.favourit[index].publishedAt.toString();
                var cont = prov.favourit[index].content.toString();
                var url = prov.favourit[index].url.toString();
                print(cont);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewsCard(
                              author: auth ,
                              title: title,
                              urlToImage: img,
                              publishedAt: pub,
                              description: descr,
                              content: cont,
                          url: url,
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: 2,
                            blurRadius: 0.8)
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            imageUrl:
                                prov.favourit[index].urlToImage.toString(),
                            fit: BoxFit.cover,
                            placeholder: (BuildContext context, String url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (BuildContext context, String url,
                                    dynamic error) =>
                                Image(image: AssetImage("asset/image/notfound.png"),fit: BoxFit.cover,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 15, right: 15),
                        child: Text(
                          prov.favourit[index].title.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              prov.favourit[index].author.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.brown),
                            ),
                            Text(
                              prov.favourit[index].publishedAt != null
                                  ? DateFormat('yyyy-MM-dd ').format(
                                      DateTime.parse(prov
                                          .favourit[index].publishedAt
                                          .toString()))
                                  : '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.grey),
                            ),

                          ],

                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                var url = prov.favourit[index].url
                                    .toString();


                                String textshare =
                                    "$url ";
                                Provider.of<FavouriteController>(
                                    context,
                                    listen: false)
                                    .share(textshare);
                              },
                              icon: Icon(
                                Icons.share,
                                size: 20,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
