import 'package:bimby_flutter/screens/bimby.dart';
import 'package:bimby_flutter/screens/home.dart';
import 'package:bimby_flutter/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:provider/provider.dart';


import 'common/theme.dart';

void main() async{
  GoogleMap.init('AIzaSyA6GtAzv28pShkWC-T1SmnQF8yKtzY4z-Q');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: { 
          '/': (context) =>HomePage(title:"HOME"),
          '/list': (context) =>Bimby(title:"CLIENTI")
        },
      );
   
  }
}
