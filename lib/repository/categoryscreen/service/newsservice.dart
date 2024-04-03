
import 'dart:convert';

import 'package:http/http.dart'as http;

import '../model/newsmodel.dart';



class NewsService{

  static HttpService(String category)async{
print("l");
    final url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=310d551a405145728ac17cadf304e6bf");
    print("m");
    var response = await http.get(url);
    print('g');
   print(response.statusCode);

    if(response.statusCode == 200){
      var data = response.body;
      var decoded = jsonDecode(data);
      print("Service");
       return NewsModels.fromJson(decoded);
    }
    else{
      return "api failed";
    }
  }
}