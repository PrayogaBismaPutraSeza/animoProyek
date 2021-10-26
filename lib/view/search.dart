import 'package:animo/widgets/widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "search doctor",
                      hintStyle: TextStyle(
                        color: Colors.white54
                      ),
                      border: InputBorder.none
                    ),
                  )
                ),

                Image.asset("assets/images/search_white.png")
              ],
            )
          ],
        ),
      ),
    );
  }
}