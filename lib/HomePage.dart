import 'package:flutter/material.dart';
import 'package:time_trackers_app/Services/Auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, @required this.auth}) : super(key: key);

  final AuthBase auth;
  // add the SignOut Method Here
  // uderscore used to mark this function as a private one
  Future<void> _signOutAnonymously() async {
    try {
      // signInAnonymously is async function so i have to wait it
      // this firebaseAuth class only has one intance
      // I am not intersted in the returned values
      /* await FirebaseAuth.instance.signOut(); */
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              print("log out pressed ! ");
              _signOutAnonymously();
            },
            child: Text(
              "Log out",
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
