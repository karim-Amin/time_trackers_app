import 'package:flutter/material.dart';
import 'package:time_trackers_app/Services/Auth.dart';
import 'package:time_trackers_app/app_sign_in/email_sign_in_form.dart';

class EmailSignIn extends StatelessWidget {
  const EmailSignIn({Key key, @required this.auth}) : super(key: key);
  final AuthBase auth;

  Widget build(BuildContext context) {
    return SignInForm(
      auth: auth,
    );
  }
}
