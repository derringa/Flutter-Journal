import 'package:flutter/material.dart';
import '../components/nav-bar.dart';

class SplashScreen extends StatefulWidget {
  NavBar homepage;

  SplashScreen({this.homepage});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.popAndPushNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(child: 
        Text(
          'Welcome to Your Journal',
          style: TextStyle(fontSize: 30.0),
        )
      ),
    );
  }
}
