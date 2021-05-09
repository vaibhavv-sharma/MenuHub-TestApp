import 'package:flutter/material.dart';

class SignedinView extends StatefulWidget {
  @override
  State createState() => HomeScreen();
}

class HomeScreen extends State<SignedinView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Welcome! this is the home screen2'),
      ),
    );
  }
}
