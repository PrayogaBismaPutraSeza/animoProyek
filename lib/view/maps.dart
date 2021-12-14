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
          position: LatLng(-7.458861053245571, 112.44256932601465),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Mojokerto Pet Care and Petshop')
        ),
        Marker(
          markerId: MarkerId('Queen PetShop & PetCare'),
          position: LatLng(-7.466078069314038, 112.44892930940249),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Queen PetShop & PetCare')
        ),
        Marker(
          markerId: MarkerId('drh. Werstant Adhityananda Rinaldhi'),
          position: LatLng(-7.464533354832634, 112.45379391966576),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'drh. Werstant Adhityananda Rinaldhi')
        ),
        Marker(
          markerId: MarkerId('Nindyo Monti Ningrum Dokter Hewan dan Petshop'),
          position: LatLng(-7.458430741231596, 112.44657595214768),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Nindyo Monti Ningrum Dokter Hewan dan Petshop')
        ),
        Marker(
          markerId: MarkerId('"LazVet" Praktek Dokter Hewan, Penitipan, Grooming'),
          position: LatLng(-7.477414563546807, 112.42851531551976),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: '"LazVet" Praktek Dokter Hewan, Penitipan, Grooming')
        ),
        Marker(
          markerId: MarkerId('Dokter Hewan Mima'),
          position: LatLng(-7.489970574844612, 112.43538563930838),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Dokter Hewan Mima')
        ),
        Marker(
          markerId: MarkerId('Klinik Hewan Garuda (Dokter Hewan) & Garuda Petshop'),
          position: LatLng(-7.493447600726969, 112.43453916931952),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Klinik Hewan Garuda (Dokter Hewan) & Garuda Petshop')
        ),
        Marker(
          markerId: MarkerId('Griya Fauna Petshop dan Petcare'),
          position: LatLng(-7.495482356107143, 112.43888208646132),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Griya Fauna Petshop dan Petcare')
        ),
        Marker(
          markerId: MarkerId('UPT Pusat Kesehatan Hewan (PUSKESWAN) Dinas Ketahanan Pangan Dan Pertanian Kota Mojokerto'),
          position: LatLng(-7.488360674616877, 112.41708102404505),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'UPT Pusat Kesehatan Hewan (PUSKESWAN) Dinas Ketahanan Pangan Dan Pertanian Kota Mojokerto')
        ),
        Marker(
          markerId: MarkerId('LINTANG PET SHOP'),
          position: LatLng(-7.496075823270963, 112.46593194775357),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'LINTANG PET SHOP')
        ),
        Marker(
          markerId: MarkerId('Cahaya Petshop & Dokter Hewan Mojokerto'),
          position: LatLng(-7.505323642094192, 112.45919634599187),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(title: 'Cahaya Petshop & Dokter Hewan Mojokerto')
        ),
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
