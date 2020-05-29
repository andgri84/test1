import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testWebApp/models/articlesHolder.dart';
import 'package:testWebApp/screens/anim.dart';
import 'package:testWebApp/screens/article-detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/theme.dart';

import 'models/article.dart';
import 'screens/bimby.dart';
import 'screens/home.dart';
const String NewsBox="NewsBox";
void main() async{
  await Hive.initFlutter(); //inizializzo db
  Hive.registerAdapter(ArticleAdapter());
  await Hive.openBox<Article>(NewsBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return ChangeNotifierProvider(
      
      create: (context) => ArticlesHolder(),
          
        
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) =>Bimby(title:"lol"),
          // Home(),
          '/article': (context) => ArticleDetail(),
        },
      ),
    );
  }
}
