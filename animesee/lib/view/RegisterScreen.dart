import 'package:animesee/components/Appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/DrawerSel.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerSel(),
        appBar: Appbar(),
        body: Container(
            child: ListView(
          padding: EdgeInsets.only(top: 40, left: 40, right: 40),
          children: [
            Image.network(
                "https://p.kindpng.com/picc/s/168-1682719_dj-anime-logo-png-transparent-png.png",
                height: 150,
                width: 150),
            SizedBox(width: 20),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: TextStyle(color: Colors.black26)),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black26)),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.black26)),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: "Confirme sua senha",
                  labelStyle: TextStyle(color: Colors.black26)),
            ),
          ],
        )));
  }
}
