import 'package:bimby_flutter/components/bimby_bar.dart';
import 'package:bimby_flutter/models/client.dart';
import 'package:bimby_flutter/screens/home.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Scheda extends StatefulWidget {
  Scheda({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _SchedaState createState() => _SchedaState();
}

class _SchedaState extends State<Scheda> with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'ANAGRAFICA'),
    Tab(text: 'ORDINI E ATTIVITA '),
  ];
  TabController _tabController;
  Client client;
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
    this.client = ModalRoute.of(context).settings.arguments;
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
          controller: _tabController, children: [tabAnagrafica(), tabOrdini()]),
    );
  }

  tabAnagrafica() {
    return Container(
        color: Colors.grey[100],
        padding: EdgeInsets.all(15),
        child: Column(children: <Widget>[tabHeader()]));
  }

  tabHeader() {
    var client = this.client;
    return ContainerBox(
        child: Column(
      children: [
        new Row(
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
                
              ],
            ),
            Expanded(
              child: Container(),
            ),
            InkWell(
                child: getIcon(client.id),
                onTap: () {
                  onLavPress();
                })
          ],
        ),
        Container(
            color: Colors.white,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Icon(
                  Icons.shopping_basket,
                  color: client.privacy ? Colors.green[800] : Colors.grey[400],
                ),
                new Icon(
                  Icons.home,
                  color:
                      client.postSales ? Colors.green[800] : Colors.grey[400],
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
                  color: client.orphan ? Colors.green[800] : Colors.grey[400],
                ),
                SizedBox(
                  width: 100,
                )
              ],
            ))
      ],
    ));
  }

  tabOrdini() {
    return Container(
        color: Colors.grey[100],
        padding: EdgeInsets.all(15),
        child: Column(children: <Widget>[tabHeader()]));
  }

  void onLavPress() {
    setState(() {
      if (this.clientBox.containsKey(this.client.id)) {
        this.clientBox.delete(this.client.id);
        return;
      }
      this.clientBox.put(this.client.id, client);
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
    );
    ;
  }
}
