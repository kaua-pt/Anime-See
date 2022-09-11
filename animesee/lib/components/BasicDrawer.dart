import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      ListTile(
        title: Text("Register",
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: "Nasalization-rg")),
        onTap: (() => Navigator.pushNamed(context, "/register")),
      ),
      ListTile(
        title: Text("Login",
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: "Nasalization-rg")),
        onTap: (() => Navigator.pushNamed(context, "/login")),
      )
    ]));
  }
}
