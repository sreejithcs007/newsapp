import 'package:hive/hive.dart';
part 'favouritemodel.g.dart';

@HiveType(typeId: 1)
class Favourite{
  @HiveField(0)
   String author;
  @HiveField(1)
   String title;
  @HiveField(2)
   String urlToImage;
  @HiveField(3)
  String? description;
  @HiveField(4)
    String? content;
  @HiveField(5)
    String?url;
  @HiveField(6)
  final DateTime publishedAt;


  Favourite(

      {required this.author,required this.title,required this.urlToImage,this.content,this.description,
  required this.publishedAt,this.url
  });

}