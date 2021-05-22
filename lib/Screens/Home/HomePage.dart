import 'package:flutter/material.dart';
import 'package:quiz_loginmodule/constants.dart';

class HomePage extends StatefulWidget {
  final String phone;
  HomePage(this.phone);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child:
            Text("LOGGED IN ! \n Welcome user <username> or ${widget.phone} "),
      ),
    );
  }
}
