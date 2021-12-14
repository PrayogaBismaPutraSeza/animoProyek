import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {

  GoogleMapController myController;
  Map<MarkerId , Marker> markers = <MarkerId , Marker>{};

  void initMarker(spesify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(spesify['location'].latitude, spesify['location'].longitude),
        infoWindow: InfoWindow(title: 'shops', snippet: spesify['address'])
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  getMarkerData() async{
    Firestore.instance.collection('data').getDocuments().then((myMockData){
      if(myMockData.documents.isNotEmpty){
        for(int i = 0; i < myMockData.documents.length ; i++)
        initMarker(myMockData.documents[i].data, myMockData.documents[i].documentID);
      }
    });
  }

  void initState(){
    getMarkerData();
    super.initState();
  }

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
