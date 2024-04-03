import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasknews/core/constants/imageconstants.dart';
import 'package:tasknews/repository/favourite/model/favouritemodel.dart';

import '../../favourite_screen/controller/favourite_screen_controller.dart';
import '../../favourite_screen/view/favourite_screen.dart';
import '../../globalwidgets/Reusable_newscard.dart';
import '../controller/categorycontroller.dart';

import 'package:intl/intl.dart';

class NewsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsViewState();
}

class NewsViewState extends State<NewsView> {
  @override
  void initState() {
    print("i");
    fetchdata();

    super.initState();
  }

  void fetchdata() {
    Provider.of<CategoryController>(context, listen: false).fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    var titl;
    var img;
    var publish;
    var des;
    var cont;

    var categoryprov = Provider.of<CategoryController>(context);
    return SafeArea(
      child: DefaultTabController(
        length: categoryprov.categorylist.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            elevation: 1,
            title: const Center(
                child: Text(
              "News Today",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25),
            )),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavouriteScreen()));
                  },
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ))
            ],
            bottom: TabBar(
              indicatorColor: Colors.red,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabs: List.generate(
                  categoryprov.categorylist.length,
                  (index) => Text(
                        categoryprov.categorylist[index],
                        style: TextStyle(fontSize: 17),
                      )),
              onTap: (index) {
                categoryprov.Ontabtap(index);
              },
            ),
          ),
          body: categoryprov.isloading == true
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: categoryprov.catgory?.articles?.length,
                  itemBuilder: (context, index) {

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          var authr = categoryprov
                                  .catgory?.articles?[index].author
                                  .toString() ??
                              "unknown author";
                          var title = categoryprov
                                  .catgory?.articles?[index].title
                                   ??
                              " title not avalable ";
                          var descr = categoryprov
                                  .catgory?.articles?[index].description
                                  ??
                              "description not found ";
                          var imge = categoryprov
                                  .catgory?.articles?[index].urlToImage
                                   ??
                              "image not found ";
                          var pub = categoryprov
                                  .catgory?.articles?[index].publishedAt
                                  .toString() ??
                              "";
                          var contn = categoryprov
                                  .catgory?.articles?[index].content
                                   ??
                              "Content not found";
                          var url = categoryprov.catgory?.articles?[index].url
                                  .toString() ??
                              "";
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewsCard(
                                        author: authr,
                                        title: title,
                                        urlToImage: imge,
                                        publishedAt: pub,
                                        content: contn,
                                        description: descr,
                                        url: url,
                                      )));
                        },
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
                                        '${categoryprov.catgory?.articles?[index].urlToImage.toString()}',
                                    fit: BoxFit.cover,
                                    placeholder: (BuildContext context,
                                            String url) =>
                                        Center(
                                            child: CircularProgressIndicator()),
                                    errorWidget: (BuildContext context,
                                            String url, dynamic error) =>
                                        Image(image: AssetImage(ImageConstants.notfound),fit: BoxFit.cover,),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 15, right: 15),
                                child: Text(
                                  categoryprov.catgory?.articles?[index].title
                                          .toString() ??
                                      "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        categoryprov.catgory?.articles?[index]
                                                .author ??
                                            " unknown author",
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.brown),
                                      ),
                                    ),
                                    Text(
                                      categoryprov.catgory?.articles?[index]
                                                  .publishedAt !=
                                              null
                                          ? DateFormat('yyyy-MM-dd ').format(
                                              DateTime.parse(categoryprov
                                                      .catgory
                                                      ?.articles?[index]
                                                      .publishedAt
                                                      .toString() ??
                                                  ""))
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        var auth1 =
                                            Provider.of<CategoryController>(
                                                        context,
                                                        listen: false)
                                                    .catgory
                                                    ?.articles?[index]
                                                    .author ??
                                                "unknown author";
                                        print(auth1);
                                        titl = Provider.of<CategoryController>(
                                                context,
                                                listen: false)
                                            .catgory
                                            ?.articles?[index]
                                            .title;
                                        img = Provider.of<CategoryController>(
                                                    context,
                                                    listen: false)
                                                .catgory
                                                ?.articles?[index]
                                                .urlToImage ??
                                            " error image ";
                                        publish =
                                            Provider.of<CategoryController>(
                                                        context,
                                                        listen: false)
                                                    .catgory
                                                    ?.articles?[index]
                                                    .publishedAt ??
                                                " date is unknown";
                                        des = Provider.of<CategoryController>(
                                                    context,
                                                    listen: false)
                                                .catgory
                                                ?.articles?[index]
                                                .description ??
                                            " description not available";
                                        cont = Provider.of<CategoryController>(
                                                    context,
                                                    listen: false)
                                                .catgory
                                                ?.articles?[index]
                                                .content ??
                                            " content is not available ";
                                        var ur =
                                            Provider.of<CategoryController>(
                                                        context,
                                                        listen: false)
                                                    .catgory
                                                    ?.articles?[index]
                                                    .url ??
                                                " unknown url";
                                        print(auth1);

                                        bool alreadyExists =
                                            Provider.of<FavouriteController>(
                                          context,
                                          listen: false,
                                        ).favourit.any((item) => item.url == ur);

                                        // If the item doesn't exist, add it to favorites
                                        if (!alreadyExists) {
                                          Provider.of<FavouriteController>(
                                            context,
                                            listen: false,
                                          ).favourite(
                                            auth1,
                                            titl,
                                            img,
                                            publish,
                                            des,
                                            cont,
                                            ur,
                                          );
                                        } else {
                                          // Notify the user that the item is already in favorites
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.blueGrey,
                                              content: Text(
                                                  'Item is already in favorites.'),
                                            ),
                                          );
                                        }
                                      },
                                      child: Text("Save For Later")),
                                  IconButton(
                                      onPressed: () {
                                        titl = Provider.of<CategoryController>(
                                                context,
                                                listen: false)
                                            .catgory
                                            ?.articles?[index]
                                            .title;
                                        var url =
                                            Provider.of<CategoryController>(
                                                    context,
                                                    listen: false)
                                                .catgory
                                                ?.articles?[index]
                                                .url;

                                        String textshare = "$url ";
                                        Provider.of<CategoryController>(context,
                                                listen: false)
                                            .share(textshare);
                                      },
                                      icon: Icon(
                                        Icons.share,
                                        size: 15,
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
