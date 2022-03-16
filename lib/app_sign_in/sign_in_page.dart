import 'package:flutter/material.dart';
import 'package:time_trackers_app/app_sign_in/sign_in_button.dart';
import 'assets_button.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              onPressed: () {
                print("Google Button Pressed");
              },
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
              onPressed: () {
                print("Facebook Button Pressed");
              },
            ),
            SizedBox(
              height: 8,
            ),
            SignInButton(
              text: "Sign In With email",
              textColor: Colors.white,
              color: Colors.teal[700],
              onPressed: () {
                print("Email Button Pressed");
              },
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
              onPressed: () {
                print("Go anonymous Button Pressed");
              },
            ),
          ],
        ),
      ),
    );
  }
}
