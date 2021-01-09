import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes_taking_app/screens/note_list_screen.dart';
import 'package:flutter_notes_taking_app/utilities/constants.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login_Page(),


  )
  );
}
// ignore: camel_case_types
class Login_Page extends StatelessWidget {
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
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(00),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Enter Email',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                              ),

                            ),
                            Container(
                              padding: EdgeInsets.all(00),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[200]))
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Enter Password',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 30,),
                      Row(
                        children: [
                          Expanded(
                            child: FlatButton(
                              onPressed: (){},
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
                              onPressed: (){},
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.black,
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