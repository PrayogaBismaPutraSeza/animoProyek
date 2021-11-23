import 'package:animo/helper/authenticate.dart';
import 'package:animo/helper/constants.dart';
import 'package:animo/helper/helperfunctions.dart';
import 'package:animo/services/auth.dart';
import 'package:animo/services/database.dart';
import 'package:animo/view/search.dart';
import 'package:animo/view/signin.dart';
import 'package:animo/widgets/widget.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  Stream chatRoomStream;

  Widget chatRoomList(){
    return StreamBuilder(
      stream: chatRoomStream,
      builder: (context, snapshot){
        return snapshot.hasData ? ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index){
            return ChatRoomTile(
              snapshot.data.documents[index].data["chatroomId"]
                .toString().replaceAll("_", "").replaceAll(Constants.myName, "")
            );
          }) : Container();
      },
    );
  }

  @override
  void initState(){
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    databaseMethods.getChatRoom(Constants.myName).then((value){
      setState(() {
        chatRoomStream = value;        
      });
    });
   setState(() {
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png", height: 50,),
        actions: [
          GestureDetector(
            onTap: (){
              authMethods.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => Authenticate()
              ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.exit_to_app)
            ),
          ),
        ],
      ),
      body: chatRoomList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => SearchScreen()
          ));
        },
      ),
    );
  }
}

class ChatRoomTile extends StatelessWidget {
  final String userName;
  ChatRoomTile(this.userName);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(40)
            ),
            child: Text("${userName.substring(0,1).toUpperCase()}", style: mediumTextStyle(),),
          ),
          SizedBox(width: 8,),
          Text(userName, style: mediumTextStyle(),)
        ],
      ),
    );
  }
}