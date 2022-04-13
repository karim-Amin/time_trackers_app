import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_trackers_app/Services/Auth.dart';
import 'package:time_trackers_app/common_widgets/form_sign_in_button.dart';

// define a type for two possible status
enum EmailSignInStatusType { SignIn, Register }

class SignInForm extends StatefulWidget {
  SignInForm({@required this.auth});
  final AuthBase auth;
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // TextEditing controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // define a variable will hold the status
  EmailSignInStatusType _signInStatus = EmailSignInStatusType.SignIn;

  void _submit() async {
    // retrive the email and password from the text editing controllers
    final email = _emailController.text;
    final password = _passwordController.text;
    User user;
    try {
      switch (_signInStatus) {
        case EmailSignInStatusType.Register:
          user =
              await widget.auth.createUserWithEmailAndPassword(email, password);
          break;
        case EmailSignInStatusType.SignIn:
          user = await widget.auth.signInWithEmailAndPassword(email, password);
          break;
      }
    } catch (e) {
      print(e.toString());
    }
    if (user != null) {
      Navigator.of(context).pop();
    }
  }

  void _toggelStatus() {
    // clear the text fileds
    _emailController.clear();
    _passwordController.clear();
    setState(() {
      _signInStatus = _signInStatus == EmailSignInStatusType.SignIn
          ? EmailSignInStatusType.Register
          : EmailSignInStatusType.SignIn;
    });
  }

  List<Widget> _buildChildren() {
    // string displayed in the first button
    String primary = _signInStatus == EmailSignInStatusType.SignIn
        ? 'Sign in'
        : 'Create an account';
    // string displayed in the second button (Text button)
    String secondery = _signInStatus == EmailSignInStatusType.SignIn
        ? 'Need an account ? Register'
        : 'Have an account ? Sign in';
    return [
      Padding(
        padding: const EdgeInsets.all(16.0),
        // assign text controller for each textField
        child: TextField(
          controller: _emailController,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            hintText: "example@example.com",
            labelText: 'Email',
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Password',
          ),
          // to hide the password when entering it
          obscureText: true,
        ),
      ),
      Container(
        padding: const EdgeInsets.all(8.0),
        height: 75.0,
        child: CustomElevatedButton(
          child: Text(
            primary,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          onPressed: _submit,
          color: Colors.indigo,
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            child: Text(
              secondery,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
            onPressed: _toggelStatus,
          )),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _buildChildren(),
          ),
        ),
      ),
    );
  }
}
