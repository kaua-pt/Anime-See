import 'package:animesee/components/Appbar.dart';
import 'package:animesee/components/TextInput.dart';
import 'package:animesee/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/DrawerSel.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  late final TextEditingController name = TextEditingController();
  late final TextEditingController email = TextEditingController();
  late final TextEditingController password = TextEditingController();
  late final TextEditingController cPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerSel(),
        appBar: Appbar(),
        backgroundColor: Colors.grey,
        body: Container(
            child: ListView(
          padding: EdgeInsets.only(top: 130, left: 40, right: 40),
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
                            hint: "Write you email",
                            textController: email),
                        SizedBox(height: 10),
                        TextInput(
                            text: "Password",
                            type: TextInputType.text,
                            hint: "Write your password",
                            isObscured: true,
                            textController: password),
                        SizedBox(height: 10),
                        TextInput(
                            text: "Confirm your password",
                            type: TextInputType.text,
                            isObscured: true,
                            hint: "Write your password again",
                            textController: cPassword),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(500, 50),
                                shadowColor: Colors.brown,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            onPressed: () => register(),
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

  register() async {
    try {
      await context
          .read<AuthService>()
          .register(email.text, password.text, cPassword.text);
      Navigator.pushNamed(context, "/");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Email successfully registered")));
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
