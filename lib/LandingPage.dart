import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_trackers_app/HomePage.dart';
import 'package:time_trackers_app/app_sign_in/sign_in_page.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // check if is there current user logged in
  // in the initialization function of the stateful
  // widget if the app is restarted will maintain its state
  @override
  void initState() {
    super.initState();
    // update the state of the landing page
    _updateUser(FirebaseAuth.instance.currentUser);
  }

  // Store the user state to decide which page to display
  User _user;
  // Define the Function which will be called back when
  // the user will sign in to Change the state of the landing page
  void _updateUser(User user) {
    print("form the landing page");
    // when the state is updated inside the setState method
    // the entire widget will rebuild
    setState(() {
      this._user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      // after sign in method completed it will update
      // the state variable in landing page
      return SignInPage(
        onSignIn: (user) => this._updateUser(user),
      );
    }
    return HomePage(
      onSignOut: () => _updateUser(null),
    ); // a place holder for the home page
  }
}
