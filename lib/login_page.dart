import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/constants.dart';
import 'package:money_manager/register_page.dart';
import 'package:money_manager/landingscreen.dart';

class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 55.0),
                Hero(
                    tag: 'logohero',
                    child: Image(
                      image: AssetImage('images/circle_logo.png'),
                      width: 100.0,
                      height: 100.0,
                    )),
                verticalBoxExtra,
                Text(
                  'Log in',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                verticalBoxExtra,
                Container(
                  width: 300.0,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white12,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white24)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent)),
                      hintText: 'Enter your Email Id',
                      hintStyle: TextStyle(
                        color: Colors.white60,
                      ),
                    ),
                  ),
                ),
                verticalBoxLarge,
                Container(
                  width: 300.0,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white12,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white24)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueAccent)),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(
                        color: Colors.white60,
                      ),
                    ),
                  ),
                ),
                verticalBoxLarge,
                Container(
                  width: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [Color(0xFFB816DA), Color(0xFFD127A6)])),
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LandingScreen()),
                        );
                      },
                      child: Center(
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      )),
                ),
                verticalBoxSmall,
                RichText(
                    text: TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: <TextSpan>[
                      TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(fontWeight: FontWeight.w200)),
                      TextSpan(
                          text: 'Sign Up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyRegisterPage()),
                              );
                            })
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
