

import 'package:intl/intl.dart';

class Article {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  getDateString(){
     var date = new DateFormat('yyyy-MM-ddTHH:mm').parse(this.publishedAt);
     return new DateFormat("dd/MM/yyyy HH:mm").format(date);
  }

  Map<String, dynamic>  toJSONObj(){
    Map<String, dynamic> json= new Map<String, dynamic> ();
      json={
      title: this.title,
      description: this.description,
      url: this.url,
      urlToImage: this.urlToImage,
      publishedAt: this.publishedAt,
      content: this.content,
      };
      return json;
  }

  Article({this.title, this.description, this.url, this.urlToImage, this.publishedAt,  this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,

    );
  }
}
