import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:quiz_loginmodule/Screens/Login/OTPpage.dart';
import 'package:quiz_loginmodule/constants.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  // ignore: override_on_non_overriding_member
  TextEditingController nameController = new TextEditingController();
  String username = "";
  bool visible = false;

  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    String phoneNumber = '';

    return Scaffold(
      backgroundColor: kPrimaryLightColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Login Page"),
      ),
      body: Container(
          child: (SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: kPrimaryLightColor,
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter name'),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IN',
                autoValidate: true,
                onChanged: (phone) {
                  //print(phone.completeNumber);
                  phoneNumber = phone.completeNumber;
                },
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.black,
            ),
            Container(
              child: RoundedButton(
                text: 'Generate OTP',
                press: () {
                  addUsername();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OTPScreen(phoneNumber);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ))),
    );
  }

  addUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', nameController.text);
  }
}
