import 'package:animesee/components/Appbar.dart';
import 'package:animesee/components/DrawerSel.dart';
import 'package:animesee/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  AuthService authS = AuthService();

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    _changePassword() {
      authS.changePassword(auth.user?.email as String);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Check your email")));
      Navigator.pushNamed(context, "/");
    }

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
                onTap: () => _changePassword()),
          ],
        ),
      )),
    );
  }
}
