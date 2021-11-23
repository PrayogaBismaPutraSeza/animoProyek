import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  getUserByUsername(String username) async {
    return await Firestore.instance
      .collection("users")
      .where("name", isEqualTo: username )
      .getDocuments();
  }

  getUserByUserEmail(String userEmail) async {
    return await Firestore.instance
      .collection("users")
      .where("email", isEqualTo: userEmail )
      .getDocuments()
      .catchError((e) {
        print(e.toString());
      });
  }

  Future<void> uploadUserInfo(userMap) async{
    Firestore.instance.collection("users").add(userMap).catchError((e){
      print(e.toString());
    });
  }

  Future<bool> createChatRoom(chatRoomId, chatRoomMap){
    Firestore.instance
      .collection("ChatRoom")
      .document(chatRoomId)
      .setData(chatRoomMap)
      .catchError((e){
        print(e.toString());
      });
  }

  Future<void> addConversationMessages(String chatRoomId, messageMap){
    Firestore.instance.collection("ChatRoom")
      .document(chatRoomId)
      .collection("chats")
      .add(messageMap)
      .catchError((e){
        print(e.toString());});
  }

  getConversationMessages(String chatRoomId) async{
    return Firestore.instance
      .collection("ChatRoom")
      .document(chatRoomId)
      .collection("chats")
      .orderBy("time")
      .snapshots();
  }

  getChatRoom(String userName) async{
    return Firestore.instance
      .collection("ChatRoom")
      .where("users", arrayContains: userName)
      .snapshots();
  }
}