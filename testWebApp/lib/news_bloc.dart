

import 'package:testWebApp/services/db.repo.dart';

class NewsBloc{
  final DbRepository _db= DbRepository();

  NewsBloc(){
    _db.watch().forEach((element){
      print("Update");
    });
  }


}