import 'package:flutter/material.dart';

class BimbyBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  TabController tabController;

  final AppBar appBar;

  BimbyBar({Key key, this.title, this.tabController, this.appBar}) : super(key: key);

  @override
  _BimbyBarState createState() => _BimbyBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}

class _BimbyBarState extends State<BimbyBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: widget.appBar.automaticallyImplyLeading,
        backgroundColor: Colors.white,
        bottom: widget.appBar.bottom,
        title: Row(
          children: <Widget>[
            Container(
              height: 22,
              child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: Image(
              image: AssetImage('images/logo.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
            ),
            Expanded(child:Container()),
            Text(widget.title),
             Expanded(child:Container()),
            GestureDetector(
            onTap: () => _showProfile(context),
              child: Text("", //bimby-Profile
                style: TextStyle(fontFamily: 'Bimby'),
             ),
            )

             ,
            
            Icon(Icons.menu, color: Colors.black,)

          ],
        ));
  }

  void _showProfile(BuildContext context) {
    setState(() {
      //_isOpenProfile = true;
    });
    Dialog simpleDialog = Dialog(
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(12.0),
      // ),
      child: Container(
        height: 350.0,
        width: 280.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[200],
                    width: 1.0,
                  ),
                ),
              ),
              height: 40,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'PROFILO',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                         // _isOpenProfile = false;
                        });
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.close)),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[200],
                      width: 1.0,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Area", style: Theme.of(context).textTheme.bodyText1),
                    Text(
                      "040 - Andreina Grieco",
                      style: TextStyle(
                        fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[200],
                      width: 1.0,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Divisione",
                        style: Theme.of(context).textTheme.bodyText1),
                    Text(
                      "042 - Andreina Grieco",
                      style: TextStyle(
                        fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[200],
                      width: 1.0,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Team", style: Theme.of(context).textTheme.bodyText1),
                    Text(
                      "050 - Andreina Grieco",
                      style: TextStyle(
                        fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[200],
                      width: 1.0,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Incaricata",
                        style: Theme.of(context).textTheme.bodyText1),
                    Text(
                      "Claudia Grieco",
                      style: TextStyle(
                        fontWeight: FontWeight.bold),
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Codice",
                        style: Theme.of(context).textTheme.bodyText1),
                    Text(
                      "19073",
                      style: TextStyle(
                        fontWeight: FontWeight.bold),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => simpleDialog);
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
