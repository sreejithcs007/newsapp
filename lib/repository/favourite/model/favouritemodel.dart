class Favourite{
   String author;
   String title;
   String urlToImage;
  String? description;
    String? content;
    String?url;
  final DateTime publishedAt;


  Favourite(

      {required this.author,required this.title,required this.urlToImage,this.content,this.description,
  required this.publishedAt,this.url
  });

}