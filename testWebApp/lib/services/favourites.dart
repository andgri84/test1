import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testWebApp/models/article.dart';

class Favourites{
   final String PREF_FAV="favourites";

  setFavourite(Article article)async
  {
      List<dynamic> favs=await this.getAllFavourites();
      var jsonA=article.toJSONObj();
      favs.add(jsonA);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(PREF_FAV, json.encode(favs));
      
  }
 Future<List<dynamic>>  getAllFavourites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      List<dynamic> favs = List<dynamic>();
      String sessjson = prefs.getString(PREF_FAV);
      if (sessjson != null) {
        favs = json.decode(sessjson);       
      }
    return favs;
  }
  Future<List<Article>> getAllFavouriteArticles()async{
      List<dynamic> favs=await this.getAllFavourites();

      return favs.map<Article>((json) => 
              Article.fromJson(json)).toList();
  }

  removeFavourite(Article article)async {

  }
  isFavourite(Article article) async{

  }
}