import 'package:bimby_flutter/models/client.dart';
import 'package:bimby_flutter/screens/bimby.dart';
import 'package:bimby_flutter/screens/home.dart';
import 'package:bimby_flutter/screens/map.dart';
import 'package:bimby_flutter/screens/scheda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';


import 'common/theme.dart';
import 'models/holder.dart';
const String ClientBox="ClientBox";
void main() async{
  GoogleMap.init('AIzaSyA6GtAzv28pShkWC-T1SmnQF8yKtzY4z-Q');
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); //inizializzo db
  Hive.registerAdapter(ClientAdapter());
  await Hive.openBox<Client>(ClientBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.

    return ChangeNotifierProvider(
      
      create: (context) => ClientsHolder(),
          
        
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: { 
          '/': (context) =>HomePage(title:"HOME"),
          '/list': (context) =>Bimby(title:"CLIENTI"),
          '/scheda': (context) =>Scheda(title:"SCHEDA CLIENTE")
        },
      ),
    );
    
   
  }
}
