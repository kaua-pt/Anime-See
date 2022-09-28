import 'package:animesee/services/AuthService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/Appbar.dart';
import '../components/DrawerSel.dart';
import '../components/TextInput.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChangePasswordScreen();
}

class _ChangePasswordScreen extends State<ChangePasswordScreen> {
  AuthService auth = AuthService();
  late final TextEditingController password = TextEditingController();
  late final TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Appbar(),
        drawer: DrawerSel(),
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
                            text: "New password",
                            type: TextInputType.emailAddress,
                            hint: "Write your new password",
                            textController: password),
                        SizedBox(height: 10),
                        TextInput(
                            text: "Confirm your new password",
                            type: TextInputType.name,
                            hint: "Confirm your new password",
                            isObscured: true,
                            textController: passwordC),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(500, 50),
                                shadowColor: Colors.brown,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25))),
                            onPressed: () => changePassword(),
                            child: Text(
                              "Finish",
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

  changePassword() async {
    try {
      await context
          .read<AuthService>()
          .changePassword(password.text, passwordC.text);
      Navigator.pushNamed(context, "/");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password Successfully Changed")));
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
