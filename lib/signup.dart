import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_taking_app/screens/note_list_screen.dart';
import 'Utilities/Constants.dart';
import 'login.dart';

// ignore: camel_case_types
class SignUp_Page extends StatefulWidget {
  @override
  _SignUp_PageState createState() => _SignUp_PageState();
}

// ignore: camel_case_types
class _SignUp_PageState extends State<SignUp_Page> {
  String uid;
  // ignore: non_constant_identifier_names
  final GlobalKey<FormState> _SignUPkey=GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  TextEditingController Semail_Controller;
  TextEditingController SnameController;
  // ignore: non_constant_identifier_names
  TextEditingController SpasswordController;
  final auth=FirebaseAuth.instance;
  @override
  initState(){
    SnameController=new TextEditingController();
    Semail_Controller =new TextEditingController();
    SpasswordController=new TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 36),
        child: Column(
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
                    'Signup',
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
                      SizedBox(height: 10,),
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
                          key: _SignUPkey,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(00),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextFormField(
                                  validator: nameValidator,
                                  controller: SnameController,
                                  decoration: InputDecoration(
                                    hintText: ' Name',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,

                                  ),
                                ),

                              ),
                              Container(
                                padding: EdgeInsets.all(00),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextFormField(
                                  validator: emailValidator,
                                  controller: Semail_Controller,
                                  decoration: InputDecoration(
                                    hintText: ' Email',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,

                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),

                              ),
                              Container(
                                padding: EdgeInsets.all(00),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                ),
                                child: TextFormField(
                                    controller: SpasswordController,
                                    validator: pwdValidator,
                                    obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: ' Password',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                {
                                  if (_SignUPkey.currentState.validate()) {


                                    FirebaseAuth.instance.
                                    createUserWithEmailAndPassword(email: Semail_Controller.text, password: SpasswordController.text)
                                        .then((currentUser) => FirebaseFirestore.instance.collection("NotesTakingApp").doc(uid)
                                        .set(
                                        {
                                          "name":SnameController.text,
                                          "email":Semail_Controller.text,
                                          "pswd":SpasswordController.text,

                                        }).then((result) => Navigator.push
                                      (context, MaterialPageRoute(builder: (context)=>Login_Page()),
                                    ),)

                                    );
                                  }
                                  else{
                                    showDialog(context: context,builder: (BuildContext context){
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
                                          ]
                                      );
                                    });
                                  }
                                };
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xFFFD5872),
                                ),
                                child: Center(
                                  child: Text("Login", style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                                ),
                              ),
                            ),

                          ),
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