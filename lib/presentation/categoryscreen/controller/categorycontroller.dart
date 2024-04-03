import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../../repository/categoryscreen/model/newsmodel.dart';
import '../../../repository/categoryscreen/service/newsservice.dart';


class CategoryController extends ChangeNotifier {
  List categorylist = [
    "business",
    "entertainment",
    "general",
    " health",
    " science ",
    "sports",
    "technology",
  ];
  var isloading = false;
  var category = 'business';
  NewsModels? catgory;

  Ontabtap(index) {
    category = categorylist[index];
    fetchdata();

    notifyListeners();
  }

  fetchdata() async {
    print("y");
    isloading = true;
    try {
      print("try");
      var fetchdata = await NewsService.HttpService(category);
      print("fetch data :  $fetchdata");

      if (fetchdata != null) {
        catgory = fetchdata;
        print(catgory?.articles?.length);
        print("controller : ${catgory?.articles?[1].urlToImage}");
        isloading = false;
        notifyListeners();
      }
    } catch (e) {
      isloading = false;
      notifyListeners();
    }
  }

  share(String textshare,){
    print("text:  $textshare");
    try {
      Share.share(textshare);
      notifyListeners();
    }catch(e){
      log("$e");

    }
    notifyListeners();



  }
}
