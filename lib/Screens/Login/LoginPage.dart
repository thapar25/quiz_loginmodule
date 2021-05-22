import 'package:flutter/material.dart';
import 'package:international_phone_input/international_phone_input.dart';

import 'package:quiz_loginmodule/Screens/Login/OTPpage.dart';

import 'package:quiz_loginmodule/constants.dart';

import 'package:flutter/services.dart';

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
  TextEditingController phoneController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  String username = "";
  String phoneNumber;
  String phoneIsoCode;
  bool visible = false;
  String confirmedNumber = '';

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    print(number);
    phoneNumber = internationalizedPhoneNumber;
    print(phoneNumber);
    phoneIsoCode = isoCode;
    confirmedNumber = internationalizedPhoneNumber;
  }

 
 

  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    String phone = '';

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
              child: InternationalPhoneInput(
                initialPhoneNumber: phoneNumber,
                initialSelection: 'IN',
                labelText: "Phone Number",
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.black,
            ),
            SizedBox(height: 50),
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    LengthLimitingTextInputFormatter(10)
                  ],
                  controller: phoneController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: kPrimaryLightColor,
                      border: OutlineInputBorder(),
                      labelText: 'Phone Number',
                      hintText: 'Enter 10-digit number'),
                ),
              ),
            ),
            Container(
              child: RoundedButton(
                text: 'Generate OTP',
                press: () {
                  phone = phoneController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OTPScreen(confirmedNumber);
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
}
