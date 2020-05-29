

import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:crypto/crypto.dart';

@HiveType(typeId:0)
class Article  extends HiveObject{
  @HiveField(0)
  String id;
   @HiveField(1)
  String title;
   @HiveField(2)
  String description;
   @HiveField(3)
  String url;
   @HiveField(4)
  String urlToImage;
   @HiveField(5)
  String publishedAt;
   @HiveField(6)
  String content;

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

  Article({this.id, this.title, this.description, this.url, this.urlToImage, this.publishedAt,  this.content});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id:toMd5(json['url'] as String),
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,

    );
  }
 static String toMd5(String input){
    return md5.convert(utf8.encode(input)).toString();
  }
}

class ArticleAdapter extends TypeAdapter<Article>{
  @override
  Article read(BinaryReader reader){

    return Article()
      ..id = reader.read()
      ..title = reader.read()
      ..description = reader.read()
      ..url = reader.read()
      ..urlToImage = reader.read()
      ..publishedAt = reader.read();
  }

  @override 
  int get typeId =>0;


  void write(BinaryWriter writer, Article obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.description);
    writer.write(obj.url);
    writer.write(obj.urlToImage);
    writer.write(obj.publishedAt);
  }

}