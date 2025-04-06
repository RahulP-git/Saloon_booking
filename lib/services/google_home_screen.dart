import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class GoogleHomeScreen extends StatefulWidget{
  @override
  _GoogleHomeScreenState createState()=>_GoogleHomeScreenState();

}

class _GoogleHomeScreenState extends State<GoogleHomeScreen>{

  static final CameraPosition _kGooglePlex=const CameraPosition(
      target: LatLng(6.824629, 4.991123),
  zoom: 14.476,);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();
    return Scaffold(
      body: GoogleMap(
          initialCameraPosition:_kGooglePlex
      ),
    );
  }

}