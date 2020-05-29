import 'package:hive/hive.dart';
import 'package:testWebApp/models/article.dart';

import '../main.dart';


class DbRepository{
  Box<Article> favoritesNews =Hive.box(NewsBox);
  addArticle(Article article) =>
    favoritesNews.put(article.id, article);

  List<Article> getArticles()=> favoritesNews.values.toList();

  watch()=>favoritesNews.watch();
}