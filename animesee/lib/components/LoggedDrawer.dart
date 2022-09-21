import 'package:animesee/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoggedDrawer extends StatefulWidget {
  @override
  State<LoggedDrawer> createState() => _LoggedDrawerState();
}

class _LoggedDrawerState extends State<LoggedDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(
            "Kauã",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: "Nasalization-rg"),
          ),
          accountEmail: Text(
            "kauaponte@hotmail.com",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: "Nasalization-rg"),
          ),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                "https://sm.ign.com/ign_br/screenshot/default/levi-ackerman-attack-on-titan_t3rm.png",
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/564x/84/c6/ad/84c6ad094b067d27d244ec61cec44806.jpg"),
                  fit: BoxFit.cover)),
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text("Favorites",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: "Nasalization-rg")),
        ),
        Divider(thickness: 1, color: Colors.black54),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: "Nasalization-rg")),
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
          leading: Icon(Icons.exit_to_app),
          title: Text("Exit",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontFamily: "Nasalization-rg")),
          onTap: () => logout(),
        )
      ],
    ));
  }

  logout() async {
    await context.read<AuthService>().logout();
    Navigator.pushNamed(context, "/");
  }
}
