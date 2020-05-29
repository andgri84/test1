import 'package:bimby_flutter/components/onslide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _key = GlobalKey<GoogleMapStateBase>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      key: _key,
      initialZoom: 12,
      initialPosition: GeoCoord(34, -118),
      mapType: MapType.roadmap,
      interactive: true,
      markers: {Marker(GeoCoord(34, -118))},
          )
      );
  }
}
