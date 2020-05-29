import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:crypto/crypto.dart';


@HiveType(typeId:0)

class Client extends HiveObject{

    @HiveField(0)
    String id;
    @HiveField(1)
    String name;
    @HiveField(2)
    String surname;
    @HiveField(3)
    String address;
    @HiveField(4)
    String cap;
    @HiveField(5)
    String city;
    @HiveField(6)
    String  lastModel;
    @HiveField(7)
    String lastPurchase;
    @HiveField(8)
    String lastContact;
    @HiveField(9)
    bool toWork;
    @HiveField(10)
    bool privacy;
    @HiveField(11)
    bool postSales;
    @HiveField(12)
    bool cookingClass;
    @HiveField(13)
    bool pcbRegistered;
    @HiveField(14)
    bool orphan;

    Client({this.id, this.name, this.surname, this.address, this.cap, this.city,this.lastModel, this.lastPurchase, this.lastContact, this.toWork, this.privacy,
    this.postSales, this.cookingClass, this.pcbRegistered, this.orphan});
    
}

class ClientAdapter extends TypeAdapter<Client>{
  @override
  Client read(BinaryReader reader){

    return Client()
      ..id = reader.read() 
      ..name = reader.read() 
      ..surname = reader.read() 
      ..address = reader.read() 
      ..cap = reader.read() 
      ..city = reader.read()
      ..lastModel = reader.read() 
      ..lastPurchase = reader.read() 
      ..lastContact = reader.read() 
      ..toWork = reader.read() 
      ..privacy = reader.read()
    ..postSales = reader.read() 
    ..cookingClass = reader.read() 
    ..pcbRegistered = reader.read()
     ..orphan= reader.read();
  }

  @override 
  int get typeId =>0;


  void write(BinaryWriter writer, Client obj) {
    writer.write(obj.id ); 
      writer.write(obj.name ); 
      writer.write(obj.surname ); 
      writer.write(obj.address ); 
      writer.write(obj.cap ); 
      writer.write(obj.city );
      writer.write(obj.lastModel ); 
      writer.write(obj.lastPurchase ); 
      writer.write(obj.lastContact ); 
      writer.write(obj.toWork ); 
      writer.write(obj.privacy );
    writer.write(obj.postSales ); 
    writer.write(obj.cookingClass ); 
    writer.write(obj.pcbRegistered );
     writer.write(obj.orphan);
  }

}