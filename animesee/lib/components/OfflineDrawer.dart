import 'package:flutter/material.dart';

class OfflineDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(""),
          accountEmail: Text(""),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Icon(Icons.person),
            ),
            backgroundColor: Colors.black26,
          ),
          decoration: BoxDecoration(color: Colors.black26),
        ),
        ListTile(
          leading: Icon(Icons.house),
          title: Text("Home",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: "Nasalization-rg")),
          onTap: () => Navigator.pushNamed(context, "/"),
        ),
        Divider(thickness: 1, color: Colors.black54),
        ListTile(
          leading: Icon(Icons.login),
          title: Text("Login",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: "Nasalization-rg")),
          onTap: (() => Navigator.pushNamed(context, "/login")),
        ),
        Divider(thickness: 1, color: Colors.black54),
        ListTile(
          leading: Icon(Icons.app_registration_rounded),
          title: Text("Register",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: "Nasalization-rg")),
          onTap: () => Navigator.pushNamed(context, "/register"),
        ),
        Divider(thickness: 1, color: Colors.black54),
        ListTile(
            leading: Icon(Icons.phone),
            title: Text("Contact",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                    fontFamily: "Nasalization-rg")),
            onTap: (() => Navigator.pushNamed(context, "/contact"))),
        Divider(thickness: 1, color: Colors.black54),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: "Nasalization-rg")),
        ),
      ],
    ));
  }
}
