import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intellium_mobile/users/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      // 2 saniye sonra LoginPage'e yönlendirme yapılıyor.
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => LoginPage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/ilogo.png',
              width: 450.0,
              height: 400.0,
            ),
          ],
        ),
      ),
    );
  }
}
