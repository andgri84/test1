
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:testWebApp/models/article.dart';
import 'package:http/http.dart' as http;

class Api{

  final String API_KEY="b30a9859a8fa4b2784e35abcca86ad3e";
  
Future<List<Article>> getHeadlines(String category) async{
 
  
  var url = 'https://newsapi.org/v2/top-headlines?country=us&category=$category&sortBy=publishedAt&apiKey='+API_KEY;
  var response = await http.get(url);

  var articles=await compute(parseArticles, response.body);
 
  return articles;
}

static List<Article> parseArticles(String responseBody) {
  final parsed = json.decode(responseBody);

  return parsed["articles"].map<Article>((json) => 
Article.fromJson(json)).toList();
}

}


