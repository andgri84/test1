import 'package:testWebApp/models/articlesHolder.dart';

import './screens/cart.dart';
import './screens/catalog.dart';
import './screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/theme.dart';
import 'models/cart.dart';
import 'models/catalog.dart';
import 'screens/home.dart';

void main() {
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
          '/': (context) => Home(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}
