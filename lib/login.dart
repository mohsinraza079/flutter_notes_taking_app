import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_taking_app/signup.dart';
import 'package:flutter_notes_taking_app/utilities/constants.dart';

import 'main.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login_Page(),


  )
  );
}
// ignore: camel_case_types
class Login_Page extends StatefulWidget {
  @override
  _Login_PageState createState() => _Login_PageState();
}


// ignore: camel_case_types
class _Login_PageState extends State<Login_Page> {
  String uid;
  // ignore: non_constant_identifier_names
  final GlobalKey<FormState> _Login=GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  TextEditingController Lemail_Controller;

  // ignore: non_constant_identifier_names
  TextEditingController LpasswordController;
  final auth=FirebaseAuth.instance;
  @override
  initState(){

    Lemail_Controller =new TextEditingController();
    LpasswordController=new TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 36),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:  BoxDecoration(
               color: headerColor,
               borderRadius: BorderRadius.only(
               bottomRight: Radius.circular(75.0),

          ),
        ),
              height: 100,
              width: double.infinity,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: headerNotesStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                                color: const Color(0xa6211f1f),
                                blurRadius: 20,
                                offset: Offset(0, 10)
                            )]
                        ),
                        child: Form(
                          key: _Login,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(00),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Enter Email',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                  validator: emailValidator,
                                  controller: Lemail_Controller,
                                  keyboardType: TextInputType.emailAddress,
                                ),

                              ),
                              Container(
                                padding: EdgeInsets.all(00),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: 'Enter Password',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                  validator: pwdValidator,
                                  controller: LpasswordController,
                                  obscureText: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Expanded(
                            child: FlatButton(
                              onPressed: (){
                                if(_Login.currentState.validate()){
                                  FirebaseAuth.instance.signInWithEmailAndPassword(email: Lemail_Controller.text, password: LpasswordController.text)
                                      .then((currentUser) => FirebaseFirestore.instance.collection("NotesTakingApp")
                                      .doc(uid).get()
                                      .then((result) => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context)=>MyApp()),
                                  ),));
                                }
                                else{
                                  showDialog(context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text("Error"),
                                        content: Text("Please Enter data"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text("Close"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Text("Login", style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),

                          ),

                          SizedBox(width: 30,),
                          Expanded(
                            child: FlatButton(
                              onPressed: (){
                                Navigator.push(context, new MaterialPageRoute(builder: (context) => SignUp_Page()));
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color:  Color(0xFFFD5872),
                                ),
                                child: Center(
                                  child: Text("Signup", style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),

                          )

                        ],
                      )
                    ],
                  ),


                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
String emailValidator(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Email format is invalid';
  } else {
    return null;
  }
}

String pwdValidator(String value) {
  if (value.length < 8) {
    return 'Password must be longer than 8 characters';
  } else {
    return null;
  }
}

// ignore: missing_return
String nameValidator(String value) {
  if (value.length < 3) {
    return 'Please enter a valid name:';
  }
}