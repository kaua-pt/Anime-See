import 'package:animesee/view/HomeScreen.dart';
import 'package:animesee/view/LoginScreen.dart';
import 'package:animesee/view/RegisterScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: "/",
      routes: {
        "/": (context) => HomeScreen(),
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
      },
    );
  }
}
