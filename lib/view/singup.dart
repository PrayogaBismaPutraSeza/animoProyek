import 'package:animo/services/auth.dart';
import 'package:animo/view/chatRoomScreen.dart';
import 'package:animo/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();

  final formKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController emailNameTextEditingController = new TextEditingController();
  TextEditingController passwordNameTextEditingController = new TextEditingController();

  signMeUp(){
    if(formKey.currentState.validate()){
      setState(() {
        isLoading = true;
      });
      
      authMethods.signUpWithEmailAndPassword(emailNameTextEditingController.text, passwordNameTextEditingController.text).then((val){
        print("$val.uid");
        
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ChatRoom()
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/images/logo.png", height: 50,),
      ),
      body: isLoading ? Container(
        child: Center(child: CircularProgressIndicator()),
      ) : SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: userNameTextEditingController,
                          style: simpleTextStyle(),
                          validator: (val){
                            return val.isEmpty || val.length < 3 ? "Enter Username 3+ characters" : null;
                          },
                          decoration: textFieldInputDecoration("username"),
                        ),
                        TextFormField(
                          controller: emailNameTextEditingController,
                          style: simpleTextStyle(),
                          validator: (val){
                            return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                            null : "Enter correct email";
                          },
                          decoration: textFieldInputDecoration("email"),
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: passwordNameTextEditingController,
                          style: simpleTextStyle(),
                          decoration: textFieldInputDecoration("password"),
                          validator:  (val){
                            return val.length < 6 ? "Enter Password 6+ characters" : null;
                          },
                        ),
                      ],
                    ),
                ),
                SizedBox(height: 8,),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    child: Text("Forgot Password?", style: simpleTextStyle(),),
                  ),
                ),
                SizedBox(height: 8,),
                GestureDetector(
                  onTap: (){
                    signMeUp();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xff007EF4),
                          const Color(0xff2A75BC)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text("Sign Up", style: simpleTextStyle(),),
                  ),
                ),
                SizedBox(height: 16,),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text("Sign Up with Google", style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                  ),),
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have account? ", style: mediumTextStyle(),),
                    Text("SignIn now",style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        decoration: TextDecoration.underline
                    ),),
                  ],
                ),
                SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}