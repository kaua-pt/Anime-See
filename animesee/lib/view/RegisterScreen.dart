import 'dart:ui';

import 'package:animesee/components/Appbar.dart';
import 'package:animesee/components/TextInput.dart';
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
    final bool meajuda = false;

    return Scaffold(
        drawer: DrawerSel(),
        appBar: Appbar(),
        backgroundColor: Colors.grey,
        body: Container(
            child: ListView(
          padding: EdgeInsets.only(top: 110, left: 40, right: 40),
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextInput(
                            text: "Name",
                            type: TextInputType.name,
                            hint: "Write your name"),
                        SizedBox(height: 10),
                        TextInput(
                            text: "Email",
                            type: TextInputType.emailAddress,
                            hint: "Write you email"),
                        SizedBox(height: 10),
                        TextInput(
                            text: "Password",
                            type: TextInputType.text,
                            hint: "Write your password"),
                        SizedBox(height: 10),
                        TextInput(
                            text: "Confirm your password",
                            type: TextInputType.text,
                            hint: "Write your password again"),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(500, 50),
                                primary: Colors.black87,
                                shadowColor: Colors.brown,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            onPressed: () => !meajuda,
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  fontFamily: "nasalization-rg", fontSize: 15),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        )));
  }
}
