import 'package:testWebApp/components/news-card.dart';
import 'package:testWebApp/models/article.dart';
import 'package:testWebApp/models/articlesHolder.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testWebApp/services/favourites.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetail extends StatelessWidget {
  Widget build(BuildContext context) {
    final Article article = ModalRoute.of(context).settings.arguments;
    final Favourites favMgr= new Favourites();
    return Scaffold(
      appBar: AppBar(
        title: Text("Article Detail"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.topLeft,
              child: Image.network(
                article.urlToImage,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: <Widget>[
                Text(article.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 30)),
                Text(article.getDateString(),
                    style: TextStyle(color: Colors.black)),
                Text(article.content,
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                FlatButton(
                  child: Text("Add to favourites"),
                  color: Colors.blue,
                  onPressed: () {

                      favMgr.setFavourite(article);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
