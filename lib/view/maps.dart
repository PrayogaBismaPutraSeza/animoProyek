import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {

  GoogleMapController myController;
  @override
  Widget build(BuildContext context) {
    Set<Marker> getMarker(){
      return <Marker>[
        Marker(
          markerId: MarkerId('Mojokerto Pet Care and Petshop'),
          position: LatLng(-7.45888, 112.4425887),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Mojokerto Pet Care and Petshop')
        )
      ].toSet();
    }
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png", height: 50,),
      ),
      body: GoogleMap(
        markers: getMarker(),
        mapType:MapType.normal ,
        initialCameraPosition: CameraPosition(
        target: LatLng(-7.471494, 112.439509),
        zoom: 14.0,),
        onMapCreated: (GoogleMapController controller){
          myController = controller;
        },
      ),
    );
  }
}
