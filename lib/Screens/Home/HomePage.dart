import 'package:flutter/material.dart';
import 'package:quiz_loginmodule/constants.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String phone;
  HomePage(this.phone);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*
  _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString('username');
  }
  */

  @override
  Widget build(BuildContext context) {
    // _loadUser();
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child:
            Text("LOGGED IN ! \n Welcome user <username> or ${widget.phone} "),
      ),
    );
  }
}
