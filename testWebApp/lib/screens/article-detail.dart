import 'package:hive/hive.dart';
import 'package:testWebApp/main.dart';
import 'package:testWebApp/models/article.dart';

import 'package:flutter/material.dart';

class ArticleDetail extends StatelessWidget {

  Widget build(BuildContext context) {
    final Article article = ModalRoute.of(context).settings.arguments;

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
                FavouriteButton(article)
              ],
            ),
          ),
        ],
      ),
    );
  }

  


}





class FavouriteButton extends StatefulWidget {
  final Article article;

  FavouriteButton(this.article, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FavButtonState();
  }
}
class _FavButtonState extends State<FavouriteButton>{

  Box<Article> favoriteBox;

  void initState() {
    super.initState();
    favoriteBox = Hive.box(NewsBox);
  }
  @override
  Widget build(BuildContext context) {
    

      isFav(){
        return favoriteBox.containsKey(widget.article.id);
      }
    
    
    return FlatButton(
                  child: Row(
                    
                    // Replace with a Row for horizontal icon + text
                    children: <Widget>[Icon(favoriteBox.containsKey(widget.article.id)?Icons.remove:Icons.add), Text("Add")],
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    if (isFav()) {
                      favoriteBox.delete(widget.article.id);
                      return;
                    }
                    favoriteBox.put(widget.article.id, widget.article);
                  },
                );
  }
  
}

