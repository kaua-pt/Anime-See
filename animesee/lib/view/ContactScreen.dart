import 'package:animesee/components/Appbar.dart';
import 'package:animesee/components/DrawerSel.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSel(),
      appBar: Appbar(),
      body: Container(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Column(children: [
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text("kauaponte@hotmail.com",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: "Nasalization-rg")),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.four_g_plus_mobiledata),
                  title: Text("Git : kaua-pt",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontFamily: "Nasalization-rg")),
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("Phone : (XX)9XXXX-XXXX",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily: "Nasalization-rg")),
                ),
              ]),
            )
          ],
        ),
      )),
    );
  }
}
