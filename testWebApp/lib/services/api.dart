
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:testWebApp/models/article.dart';
import 'package:testWebApp/services/db.repo.dart';

const String API="https://newsapi.org/v2/";
class Api{
  
  final Dio dio= Dio();
  final DioCacheManager dioCache=DioCacheManager(CacheConfig(baseUrl:API));
  final String API_KEY="b30a9859a8fa4b2784e35abcca86ad3e";

  Api(){
    dio.options.baseUrl=API;
    dio.options.connectTimeout=5000;
    dio.transformer=FlutterTransformer();
    if(!kIsWeb)
    {
        dio.interceptors.add(dioCache.interceptor);
    }
    
    dio.interceptors.add(InterceptorsWrapper(
    onRequest:(RequestOptions options) async {
     LinkedHashMap<String,dynamic> params= options.queryParameters;
     params['apiKey']=API_KEY;
     options.queryParameters=params;
     return options;  
    },
    onResponse:(Response response) async {
     // Do something with response data
     return response; // continue
    },
    onError: (DioError e) async {
     // Do something with response error
     return  e;//continue
    }
    ));
  
  }
  
Future<List<Article>> getHeadlines(String category) async{
 
  
  var url = 'https://newsapi.org/v2/top-headlines?country=us&category=$category&sortBy=publishedAt';
  var response = await dio.get(url,
    options: buildCacheOptions(Duration(seconds: 30)));
  
  
  return response.data['articles'].map<Article>((json)=> Article.fromJson(json)).toList();
}

static List<Article> parseArticles(String responseBody) {
  final parsed = json.decode(responseBody);

  return parsed["articles"].map<Article>((json) => 
Article.fromJson(json)).toList();
}

}


