import 'package:animo/view/chatRoomScreen.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 100,),
            Image.asset("assets/images/logo.png", height: 80,),
            SizedBox(height: 100,),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoom()
                  ));
                },
                child: Text("Konsultasi", style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ChatRoom()
                  ));
                },
                child: Text("Pet Shop Terdekat", style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}