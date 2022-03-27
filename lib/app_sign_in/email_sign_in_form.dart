import 'package:flutter/material.dart';
import 'package:time_trackers_app/common_widgets/form_sign_in_button.dart';

class SignInForm extends StatefulWidget {
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void _submit() {
    print(
        'email : ${_emailController.text} password : ${_passwordController.text}');
  }

  List<Widget> _buildChildren() {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
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
        padding: const EdgeInsets.all(8.0),
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
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomElevatedButton(
          text: 'Sign in',
          onPressed: _submit,
          color: Colors.indigo,
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            child: Text(
              'Do not have an account ?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
            onPressed: () {},
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
