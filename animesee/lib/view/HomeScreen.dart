import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
        ]),
      ),
      appBar: AppBar(
        title: Text("AnimeSee",
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: "Nasalization-rg")),
      ),
    );
  }
}

Widget biuldHeader(BuildContext context) => Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    );
