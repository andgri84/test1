
import 'package:testWebApp/models/article.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  NewsCard(this.article, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.title;
    
    return InkWell(
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(children: <Widget>[
          Image.network(
            article.urlToImage,
            fit: BoxFit.fill,
          ),
          Text(article.title, style: TextStyle(color: Colors.black)),
          Text(article.getDateString(),
              style: TextStyle(color: Colors.black))
        ]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/article', arguments: article);
      },
    );
  }
}
