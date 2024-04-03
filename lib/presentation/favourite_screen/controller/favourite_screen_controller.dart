import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tasknews/repository/categoryscreen/model/newsmodel.dart';
import 'package:tasknews/repository/favourite/model/favouritemodel.dart';

class FavouriteController extends ChangeNotifier{

  var isloading = false;

  List<Favourite>favourit = [];
  NewsModels? newsmod;
  var ispressed = false;



  favourite(String auth, String title , String img ,DateTime publish,String des , String cont, url){
    ispressed = false;
    print("cont $auth");
  favourit.add(Favourite(author: auth,
      title: title,
      urlToImage: img,
      publishedAt: publish,
      description: des,
      content: cont,
      url: url));
  notifyListeners();

  }

  void share(String textshare) {
    try{
      Share.share(textshare);
    }catch(e){
      print(e);
    }
    notifyListeners();
  }
}