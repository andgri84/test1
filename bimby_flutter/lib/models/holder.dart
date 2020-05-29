import 'package:flutter/foundation.dart';

import 'client.dart';



class ClientsHolder extends ChangeNotifier {

  

  
  List<Client> _Clients = [];

  ClientsHolder()
  {
    getFakeList();
    notifyListeners();
  }

  getFakeList(){
    
    var clients= new List<Client>();
    clients.add(new Client(id: 'q1', 
      name :'Andreina', 
      surname :'Grieco', 
      address :'Via Verdi 21', 
      cap :'20127', 
      city :'Milano',
      lastModel :'TM5', 
      lastPurchase :'21.12.2020', 
      lastContact :'Demo', 
      toWork :false, 
      privacy :false,
    postSales :true, 
    cookingClass :true, 
    pcbRegistered :false,
     orphan:true));

     clients.add(new Client(id: 'q10', 
      name :'Mario', 
      surname :'Rossi', 
      address :'Via Lulli 21', 
      cap :'20127', 
      city :'Reggio Emilia',
      lastModel :'TM5', 
      lastPurchase :'21.01.2020', 
      lastContact :'Ufficio', 
      toWork :false, 
      privacy :false,
    postSales :false, 
    cookingClass :false, 
    pcbRegistered :false,
     orphan:true));

     clients.add(new Client(id: 'q2', 
      name :'Claudia', 
      surname :'Grieco', 
      address :'Via Rossi 21', 
      cap :'20127', 
      city :'Salerno',
      lastModel :'TM5', 
      lastPurchase :'22.12.2021', 
      lastContact :'CASA', 
      toWork :false, 
      privacy :true,
    postSales :false, 
    cookingClass :false, 
    pcbRegistered :true,
     orphan:true));

     clients.add(new Client(id: 'q3', 
      name :'Daniela', 
      surname :'Grieco', 
      address :'Via Gialli 21', 
      cap :'20127', 
      city :'Salerno',
      lastModel :'TM5', 
      lastPurchase :'22.12.2021', 
      lastContact :'CASA', 
      toWork :false, 
      privacy :true,
    postSales :false, 
    cookingClass :false, 
    pcbRegistered :true,
     orphan:true));
     clients.add(new Client(id: 'q4', 
      name :'Barbara', 
      surname :'Grieco', 
      address :'Via Blu 21', 
      cap :'20127', 
      city :'Salerno',
      lastModel :'TM5', 
      lastPurchase :'22.12.2021', 
      lastContact :'CASA', 
      toWork :false, 
      privacy :true,
    postSales :false, 
    cookingClass :false, 
    pcbRegistered :true,
     orphan:true));

     _Clients=clients;

  }

 
 

  void set Clients(List<Client> clients)
  {
    _Clients=clients;
    notifyListeners();
  }

  List<Client> get clients => _Clients;
}
