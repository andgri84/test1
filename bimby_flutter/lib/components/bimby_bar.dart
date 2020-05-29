import 'package:flutter/material.dart';

class BimbyBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  BimbyBar({Key key, this.title}) : super(key: key);

  @override
  _BimbyBarState createState() => _BimbyBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}

class _BimbyBarState extends State<BimbyBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            Container(
              height: 22,
              child: Image(
                  image: AssetImage('images/logo.png'), fit: BoxFit.fitHeight),
            ),
            Expanded(child:Container()),
            Text(widget.title),
             Expanded(child:Container()),
             Text("", //bimby-Profile
                style: TextStyle(fontFamily: 'Bimby'),
             ),
            
            Icon(Icons.menu, color: Colors.black,)

          ],
        ));
  }
}


class BimbyFooter extends StatelessWidget {
 
 Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
  return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
}
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: hexToColor("#113c2b"),
        
        child: Container(
          height: 50,
           padding: EdgeInsets.all(15),
          child:Text('Vorwerk Bimby', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
          ,)
        ),
      );
  }
}
