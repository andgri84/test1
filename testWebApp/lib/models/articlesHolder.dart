import 'package:flutter/foundation.dart';
import 'package:testWebApp/models/article.dart';
import 'package:testWebApp/services/api.dart';

import 'catalog.dart';

class ArticlesHolder extends ChangeNotifier {

  
  List<Article> _articles = [];

  ArticlesHolder()
  {
    var api= new Api();
    api.getHeadlines().then((value)=>articles=value);
    notifyListeners();
  }

  
 

  void set articles(List<Article> news)
  {
    _articles=news;
    notifyListeners();
  }

  List<Article> get articles => _articles;
}
