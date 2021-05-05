import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/constants.dart';
import 'package:money_manager/login_page.dart';
import 'package:money_manager/register_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                verticalBoxSmall,
                Hero(
                    tag: 'logohero',
                    child: Image(
                        width: 100.0,
                        height: 100.0,
                        image: AssetImage('images/circle_logo.png'))),
                verticalBoxExtra,
                verticalBoxExtra,
                Container(
                  width: 200.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [kBgColorOne, kBgColorTwo])),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyLoginPage()),
                      );
                    },
                    child: Center(
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                verticalBoxSmall,
                Container(
                  width: 200.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [kBgColorOne, kBgColorTwo])),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyRegisterPage()),
                      );
                    },
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
