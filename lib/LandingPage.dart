import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_trackers_app/HomePage.dart';
import 'package:time_trackers_app/Services/Auth.dart';
import 'package:time_trackers_app/app_sign_in/sign_in_page.dart';

class LandingPage extends StatelessWidget {
  // inject the landing page with auth object to
  // hide the impelementation
  const LandingPage({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    // this stream bulider gives a snapshot from the stream
    // to rebuild the widget based on the data of the snapshot
    return StreamBuilder<User>(
      stream: auth.onAuthStateChange(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User user = snapshot.data;
          if (user == null) {
            // after sign in method completed it will update
            // the state variable in landing page
            return SignInPage(
              auth: auth,
            );
          }
          return HomePage(
            auth: auth,
          ); // a place holder for the home page
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
