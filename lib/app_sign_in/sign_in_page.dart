import 'package:flutter/material.dart';
import 'package:time_trackers_app/Services/Auth.dart';
import 'package:time_trackers_app/app_sign_in/email_sign_in_page.dart';
import 'package:time_trackers_app/app_sign_in/sign_in_button.dart';
import 'assets_button.dart';

class SignInPage extends StatelessWidget {
  // Constructor to set the call back function
  const SignInPage({Key key, @required this.auth}) : super(key: key);

  // inject this object to the constructor to use the functions
  final AuthBase auth;
  // uderscore used to mark this function as a private one
  Future<void> _signInAnonymously() async {
    try {
      // signInAnonymously is async function so i have to wait it
      // this firebaseAuth class only has one intance
      //final userCredentials = await FirebaseAuth.instance.signInAnonymously();
      // call the function and pass the new state
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      // signInAnonymously is async function so i have to wait it
      // this firebaseAuth class only has one intance
      //final userCredentials = await FirebaseAuth.instance.signInAnonymously();
      // call the function and pass the new state
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook() async {
    try {
      // signInAnonymously is async function so i have to wait it
      // this firebaseAuth class only has one intance
      //final userCredentials = await FirebaseAuth.instance.signInAnonymously();
      // call the function and pass the new state
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context) {
    // we have a navigator stack when the app is created
    // push on this stack a new route which containes the widegt
    Navigator.of(context).push(
      // creating new route
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => EmailSignIn(
          auth: auth,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer Tracker"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 2, 16, 2),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              AssetsButton(
                assetName: "images/google-logo.png",
                text: "Sign in with Google",
                textColor: Colors.black87,
                onPressed: _signInWithGoogle,
                color: Colors.white,
              ),
              SizedBox(
                height: 8.0,
              ),
              AssetsButton(
                assetName: "images/facebook-logo.png",
                text: "Sign in with Facebook",
                textColor: Colors.white,
                color: Color(0xFF334D92),
                onPressed: _signInWithFacebook,
              ),
              SizedBox(
                height: 8,
              ),
              SignInButton(
                text: "Sign In With email",
                textColor: Colors.white,
                color: Colors.teal[700],
                onPressed: () => _signInWithEmail(context),
              ),
              Container(
                child: Text(
                  "or",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87,
                  ),
                ),
                margin: EdgeInsets.all(8.0),
                alignment: Alignment.center,
              ),
              SignInButton(
                text: "Go anonymous",
                textColor: Colors.black,
                color: Colors.lime[300],
                onPressed: () => _signInAnonymously(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
