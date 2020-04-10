
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:testWebApp/models/article.dart';
import 'package:testWebApp/models/articlesHolder.dart';
import 'package:http/http.dart' as http;

class Api{

  final String API_KEY="b30a9859a8fa4b2784e35abcca86ad3e";
  Future<void> fetchArticles(var context) async{
  var articlesHolder= Provider.of<ArticlesHolder>(context, listen:false);
  
  var url = 'http://newsapi.org/v2/everything?q=bitcoin&from=2020-03-10&sortBy=publishedAt&apiKey='+API_KEY;
  var response = await http.get(url);

  var articles=await compute(parseArticles, response.body);
 
  return articles;
}
Future<List<Article>> getHeadlines() async{
 
  
  var url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey='+API_KEY;
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


