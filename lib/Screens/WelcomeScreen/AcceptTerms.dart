import 'package:flutter/material.dart';
import '../../constants.dart';
import '../Login/LoginPage.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class AcceptTerms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Game of Quiz",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 46),
            ),
            Container(
              alignment: Alignment.center,
              height: size.height * 0.4,
              width: size.width * 0.4,
              color: Colors.red,
              child: Text("Logo goes here"),
            ),
            SizedBox(
                height: size.height * 0.08,
                child: Text.rich(TextSpan(
                    text: 'By continuing, you agree to our ',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // ignore: unnecessary_statements
                              _launchTOS(); // function
                            }),
                      TextSpan(
                          text: ' and ',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // ignore: unnecessary_statements
                                    _launchTOS();
                                  })
                          ])
                    ]))),
            SizedBox(height: size.height * 0.2),
            RoundedButton(
              text: "ACCEPT",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void _launchTOS() async => await canLaunch('https://www.google.com/')
    ? await launch('https://www.google.com/')
    : throw 'Could not launch';
