
import 'package:hive/hive.dart';
import 'package:testWebApp/models/article.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class NewsCard extends StatefulWidget {
  final Article article;

  NewsCard(this.article, {Key key}) : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  Box<Article> favoriteBox;

  @override
  void initState() {
    super.initState();
    favoriteBox = Hive.box(NewsBox);
  }

  Widget getIcon(String id) {
    if (favoriteBox.containsKey(id)) {
      return Icon(Icons.favorite, color: Colors.red);
    }
    return Icon(Icons.favorite_border);
  }

  void onFavoritePress() {
    setState(() {
         if (favoriteBox.containsKey(widget.article.id)) {
      favoriteBox.delete(widget.article.id);
      return;
    }
    favoriteBox.put(widget.article.id, widget.article);
    });
   
  }


  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.title;
    
    return InkWell(
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(children: <Widget>[
          Image.network(
            widget.article.urlToImage,
            fit: BoxFit.fill,
          ),
          Text(widget.article.title, style: TextStyle(color: Colors.black)),
          Text(widget.article.getDateString(),
              style: TextStyle(color: Colors.black)),
              getIcon(widget.article.id)
        ]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/article', arguments: widget.article);
       onFavoritePress();
      },
    );
  }
}
