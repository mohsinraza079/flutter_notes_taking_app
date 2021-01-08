import 'package:flutter/material.dart';
import 'package:flutter_notes_taking_app/screens/note_list_screen.dart';
import 'package:flutter_notes_taking_app/screens/note_view_screen.dart';
import 'package:flutter_notes_taking_app/splaashscreen.dart';

import 'package:provider/provider.dart';

import 'db_helper/note_provider.dart';
import 'screens/note_edit_screen.dart';

void main() {
  runApp(SplashScreen());
}
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: NoteProvider(),
      child: MaterialApp(
        title: "Flutter Notes",
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => NoteListScreen(),
          note_view_screen.route: (context) => note_view_screen(),
          NoteEditScreen.route: (context) => NoteEditScreen(),
        },
      ),
    );
  }
}