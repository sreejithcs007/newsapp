import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tasknews/repository/categoryscreen/model/newsmodel.dart';
import 'package:tasknews/repository/favourite/model/favouritemodel.dart';

class FavouriteController extends ChangeNotifier{

  var isloading = false;
  var box =  Hive.box('favourite');

  List<Favourite>favourit = [];
  NewsModels? newsmod;
  var ispressed = false;



  favourite(String auth, String title , String img ,DateTime publish,String des , String cont, url) async {

    print("cont $auth");

      final sample = Favourite(author: auth,
          title: title,
          urlToImage: img,
          publishedAt: publish,
          description: des,
          content: cont,
          url: url);

      await box.add(sample);
    favourit.addAll(box.values.map((dynamic value) => value as Favourite));
      notifyListeners();


  }

  void  getAllCategories(){
    favourit.clear();
    favourit.addAll(box.values.map((dynamic value) => value as Favourite));
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