import 'dart:ui';

import 'package:animesee/components/Appbar.dart';
import 'package:animesee/components/TextInput.dart';
import 'package:animesee/controllers/UserController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/DrawerSel.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  late final UserController controller;
  late final TextEditingController name;
  late final TextEditingController email;
  late final TextEditingController password;
  late final TextEditingController cPassword;

  @override
  void initState() {
    super.initState();
    controller = UserController(
        name: name.text,
        email: email.text,
        password: password.text,
        cPassword: cPassword.text);
  }

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
                            hint: "Write your name",
                            textController: name),
                        SizedBox(height: 10),
                        TextInput(
                            text: "Email",
                            type: TextInputType.emailAddress,
                            hint: "Write you email",
                            textController: email),
                        SizedBox(height: 10),
                        TextInput(
                            text: "Password",
                            type: TextInputType.text,
                            hint: "Write your password",
                            textController: password),
                        SizedBox(height: 10),
                        TextInput(
                            text: "Confirm your password",
                            type: TextInputType.text,
                            hint: "Write your password again",
                            textController: cPassword),
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
                            onPressed: () => validateRegister(),
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

  void validateRegister() {
    if (controller.registerUser() == 200) {
      Navigator.pushNamed(context, "/");
    } else {}
  }
}
