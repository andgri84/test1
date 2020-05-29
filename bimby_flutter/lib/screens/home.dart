import 'package:bimby_flutter/components/bimby_bar.dart';
import 'package:bimby_flutter/components/onslide.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new BimbyBar(
        title: widget.title,
      ),

      bottomNavigationBar: BimbyFooter(),
      body: Container(
        color: Colors.grey[100],
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            ContainerBox(
                child: Row(
              children: <Widget>[
                Text("Ciao", style: TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                  ),
                  child: Text(
                    "Ivana",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )),
            SizedBox(height:10),
            Stack(children: <Widget>[
              ContainerBox(
                child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Lista clienti",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green)),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                      ),
                      child: Text(
                        "Accedi alla tua lista clienti",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 10),
                      ),
                    )
                  ],
                ),
                Text(
                  "", //bimby-Profile
                  style: TextStyle(fontFamily: 'Bimby'),
                ),
                

              
              ],
            ))
            ,
            Positioned(
              top: 0,
              bottom: 0,
              right:0,
              child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.green,
                        ),
                        child: Icon(Icons.arrow_forward, color: Colors.white)) ,
            )
            
            ]
            ,)

            
          ],
        ),
      ),
    );
  }
}

class ContainerBox extends StatelessWidget {
  final Widget child;

  ContainerBox({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey, offset: Offset(0.0, 1.0), blurRadius: 10.0)
        ]),
        padding: EdgeInsets.all(15),
        child: child);
  }
}
