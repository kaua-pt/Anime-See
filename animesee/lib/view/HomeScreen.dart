import 'package:animesee/components/Appbar.dart';
import 'package:animesee/components/DrawerSel.dart';
import 'package:animesee/components/LoggedDrawer.dart';
import 'package:animesee/components/OfflineDrawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSel(),
      appBar: Appbar(),
      body: Container(child: Text("Tela principal")),
    );
  }
}

Widget biuldHeader(BuildContext context) => Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    );
