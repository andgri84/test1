import 'package:bimby_flutter/components/bimby_bar.dart';
import 'package:bimby_flutter/components/onslide.dart';
import 'package:bimby_flutter/models/client.dart';
import 'package:bimby_flutter/models/holder.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class Bimby extends StatefulWidget {
  Bimby({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _BimbyState createState() => _BimbyState();
}

class _BimbyState extends State<Bimby> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LISTA'),
    Tab(text: 'DA LAVORARE'),
  ];
  TabController _tabController;

  Box<Client> clientBox;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    clientBox = Hive.box(ClientBox);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new BimbyBar(
          title: widget.title,
          tabController: this._tabController,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: TabBar(
              tabs: myTabs,
              isScrollable: false,
              controller: _tabController,
              indicatorColor: Colors.green,
              indicatorWeight: 2,
              labelColor: Colors.black,
            ),
          )),
      body: TabBarView(
        controller: _tabController,
        children:[
          tabLista(),
          tabLav()
        ]),
    );
  }

  Widget text(String up, String down) {
    return Column(
      children: <Widget>[
        Text(
          up,
          style: TextStyle(fontWeight: FontWeight.w200),
        ),
        Text(
          down,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  firstRow(Client client) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: new Row(
          children: <Widget>[
            new Icon(
              Icons.person_pin,
              color: Colors.green[800],
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(client.name + ' ' + client.surname,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                Text(client.address + ' ' + client.cap + ", " + client.city,
                    style: TextStyle(fontSize: 16))
              ],
            ),
            Expanded(
              child: Container(),
            ),
            InkWell(
              child:getIcon(client.id),
              onTap: () {
                        onLavPress(client);
               })
          ],
        ));
  }

  tabLista() {
    return Consumer<ClientsHolder>(builder: (context, clients, child) {
      return new Center(
          child: new ListView.builder(
              itemCount: clients.clients.length,
              itemBuilder: (context, position) =>
                  buildCard(clients.clients[position])));
    });
  }
  tabLav() {
    List<Client> clients=clientBox.values.toList();
      return new Center(
          child: new ListView.builder(
              itemCount: clients.length,
              itemBuilder: (context, position) =>
                  buildCard(clients[position])));
    
  }

  buildCard(Client client) {

    return  InkWell(
              child:Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
      child: OnSlideSimple(
        items: [
          new ActionItemsSimple(
              icon: new IconButton(
                icon: new Icon(Icons.call),
                onPressed: () {},
                color: Colors.white,
              ),
              onPress: () {},
              backgroudColor: Colors.green[500]),
          new ActionItemsSimple(
              icon: new IconButton(
                icon: new Icon(Icons.email),
                onPressed: () {},
                color: Colors.white,
              ),
              onPress: () {},
              backgroudColor: Colors.green[900])
        ],
        child: new Container(
          width: 300.0,
          height: 150.0,
          child: new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey[200],
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[800],
                    blurRadius: 5.0,
                    // has the effect of softening the shadow
                    spreadRadius: 2.0,
                    // has the effect of extending the shadow
                    offset: Offset(
                      2.0, // horizontal, move right 10
                      2.0, // vertical, move down 10
                    ),
                  )
                ],
                borderRadius: new BorderRadius.all(const Radius.circular(0.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  firstRow(client),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey[500],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text("Ult.mod.", client.lastModel),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey[300],
                      ),
                      text("Ult.acquisto", client.lastPurchase),
                      Container(
                        width: 1,
                        height: 40,
                        color: Colors.grey[300],
                      ),
                      text("Tipo ult. cont.", client.lastContact)
                    ],
                  ),
                  Expanded(
                      child: Container(
                          color: Colors.grey[100],
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new Icon(
                                Icons.shopping_basket,
                                color: client.privacy
                                    ? Colors.green[800]
                                    : Colors.grey[400],
                              ),
                              new Icon(
                                Icons.home,
                                color: client.postSales
                                    ? Colors.green[800]
                                    : Colors.grey[400],
                              ),
                              new Icon(
                                Icons.airport_shuttle,
                                color: client.cookingClass
                                    ? Colors.green[800]
                                    : Colors.grey[400],
                              ),
                              new Icon(
                                Icons.airline_seat_flat,
                                color: client.pcbRegistered
                                    ? Colors.green[800]
                                    : Colors.grey[400],
                              ),
                              new Icon(
                                Icons.perm_device_information,
                                color: client.orphan
                                    ? Colors.green[800]
                                    : Colors.grey[400],
                              ),
                              SizedBox(
                                width: 100,
                              )
                            ],
                          )))
                ],
              )),
        ),
      ),
    ),
              onTap: () {
                        Navigator.pushNamed(context, '/scheda', arguments: client);
               });
    
  }

  void onLavPress(Client client) {
    setState(() {
      if (this.clientBox.containsKey(client.id)) {
        this.clientBox.delete(client.id);
        return;
      }
      this.clientBox.put(client.id, client);
    });
  }

  Widget getIcon(String id) {
    if (this.clientBox.containsKey(id)) {
      return Text(
                    "", //bimby-Tag-attivo
                    style: TextStyle(
                        fontFamily: 'Bimby', fontSize: 20, color: Colors.green[800]),
                  );
    }
    return Text(
                    "", //bimby-Tag-disattivo
                    style: TextStyle(
                        fontFamily: 'Bimby', fontSize: 20, color: Colors.green[800]),
                  );;
  }
}
