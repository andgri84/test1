import 'package:testWebApp/components/news-card.dart';
import 'package:testWebApp/models/articlesHolder.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testWebApp/services/favourites.dart';

class Home extends StatelessWidget {
  var isLargeScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("News"),
        ),
        body: OrientationBuilder(builder: (context, orientation) {
          if (MediaQuery.of(context).size.width >= 768) {
            isLargeScreen = true;
          } else {
            isLargeScreen = false;
          }

          return Column(
            children: <Widget>[
              NewsButtons(),
              Consumer<ArticlesHolder>(
                builder: (context, news, child) {
                  if (isLargeScreen) {
                    return Expanded(
                        child: GridView.count(
                      crossAxisCount: 3,
                      children: new List<Widget>.generate(news.articles.length,
                          (index) {
                        return NewsCard(news.articles[index]);
                      }),
                    ));
                  } else {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: news.articles.length,
                            itemBuilder: (context, position) =>
                                NewsCard(news.articles[position])));
                  }
                },
              )
            ],
          );
        }));
  }
}

class NewsButtons extends StatelessWidget {
  NewsButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categories = [
      'general',
      'entertainment',
      'health',
      'favourites'
    
    ];
    final Favourites favMgr= new Favourites();
    
    return ButtonBar(
      alignment: MainAxisAlignment.center,
        children: new List<Widget>.generate(categories.length, (index) {
      return FlatButton(
        child: Text(categories[index]),
        color: Colors.blue,
        onPressed: () async{
            if(categories[index]=='favourites')
            {
                var articles=await favMgr.getAllFavouriteArticles();
                var holder=Provider.of<ArticlesHolder>(context, listen: false);
                holder.articles=articles;
            }
            else
            {
                Provider.of<ArticlesHolder>(context, listen: false).changeCategory(categories[index]);
            }
             
        },
      );
    }));
  }
}
