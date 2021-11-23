import 'package:animo/helper/helperfunctions.dart';
import 'package:animo/view/chatRoomScreen.dart';
import 'package:flutter/material.dart';

import 'helper/authenticate.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool userIsLoggedIn = false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn  = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal[700],
        scaffoldBackgroundColor: Colors.teal[100],
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
        home: userIsLoggedIn ? ChatRoom() : Authenticate(),
      );
  }
}

