// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:testWebApp/models/article.dart';
import 'package:testWebApp/models/articlesHolder.dart';

import '../models/cart.dart';
import '../models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("News"),
        
      ),
      body: Consumer<ArticlesHolder>(
              builder: (context, news, child) {
                return ListView.builder(
                    itemCount: news.articles.length,
                    itemBuilder: (context, position) =>
                        NewsCard(news.articles[position]));
              },
            )
    );
  }
}



class NewsCard extends StatelessWidget {
  final Article article;

  NewsCard(this.article, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var textTheme = Theme.of(context).textTheme.title;

    return Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child:
            Stack(
              
                children: <Widget>[
                    Image.network(
                  article.urlToImage,
                  fit: BoxFit.fill,
                ),
                      Positioned(
                      left: 5,
                      bottom: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                         
                            Text(article.title,style:TextStyle(color: Colors.white)),
                            Text(article.publishedAt,style:TextStyle(color: Colors.white))
                        ],
                      )
                    ),
                
                
                ]
            )
           ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
        );
  }
}


