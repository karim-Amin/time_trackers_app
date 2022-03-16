import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:time_trackers_app/app_sign_in/sign_in_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Time Tracker"),
        ),
        body:SignInPage(),
      ),
    );
  }
}