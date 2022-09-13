import 'package:animesee/components/LoggedDrawer.dart';
import 'package:animesee/components/OfflineDrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  bool get isUserLogged => false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: isUserLogged ? LoggedDrawer() : OfflineDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("AnimeSee",
            style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: "Nasalization-rg")),
        centerTitle: true,
      ),
    );
  }
}

Widget biuldHeader(BuildContext context) => Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    );
