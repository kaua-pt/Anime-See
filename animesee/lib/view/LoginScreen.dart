import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/Appbar.dart';
import '../components/DrawerSel.dart';
import '../components/TextInput.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerSel(),
        appBar: Appbar(),
        backgroundColor: Colors.grey,
        body: Container(
            child: ListView(
          padding: EdgeInsets.only(top: 150, left: 40, right: 40),
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
                            text: "Email",
                            type: TextInputType.emailAddress,
                            hint: "Write your email"),
                        SizedBox(height: 10),
                        TextInput(
                            text: "Password",
                            type: TextInputType.name,
                            hint: "Write your password",
                            isObscured: true),
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
                            onPressed: () => null,
                            child: Text(
                              "Login",
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
