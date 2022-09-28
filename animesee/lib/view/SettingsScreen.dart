import 'package:animesee/components/Appbar.dart';
import 'package:animesee/components/DrawerSel.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      drawer: DrawerSel(),
      body: Container(
          child: Center(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.abc),
              title: Text("Change password",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontFamily: "Nasalization-rg")),
              onTap: () => Navigator.pushNamed(context, "/cpassword"),
            )
          ],
        ),
      )),
    );
  }
}
