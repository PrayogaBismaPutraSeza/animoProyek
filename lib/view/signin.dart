import 'package:animo/view/chatRoomScreen.dart';
import 'package:animo/view/home.dart';
import 'package:animo/view/search.dart';
import 'package:animo/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);

  @override 
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        //backgroundColor: Colors.teal[700],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage ("assets/images/bg.jpg"),
            fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 100,
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration("email"),
                  ),
                  TextField(
                    obscureText: true,
                    style: simpleTextStyle(),
                    decoration: textFieldInputDecoration("password"),
                    ),
                  SizedBox(height: 8,),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      child: Text("Forgot Password?", style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),),
                    ),
                  ),
                  SizedBox(height: 8,),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => homeScreen()
                        ));
                      },
                      child: Text("Sign In", style: simpleTextStyle(),)
                    ),
                  ),
                  SizedBox(height: 16,),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text("Sign In with Google", style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have account? ", style: mediumTextStyle(),),
                      GestureDetector(
                        onTap: (){
                          widget.toggle();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("Register now",style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                            decoration: TextDecoration.underline
                          ),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}