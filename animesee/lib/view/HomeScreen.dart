import 'package:animesee/components/Appbar.dart';
import 'package:animesee/components/DrawerSel.dart';
import 'package:animesee/components/ScrollRow.dart';
import 'package:animesee/repositories/AnimeRepositories.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  AnimeRepositories api = AnimeRepositories();

  @override
  Widget build(BuildContext context) {
    api.fetchPopular();
    return Scaffold(
      drawer: DrawerSel(),
      appBar: Appbar(),
      body: Container(
          child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 30),
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: 50, maxWidth: 1000, maxHeight: 223, minHeight: 40),
              child: ScroolRow(list: api.getReturn(), title: "Popular Anime"),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Divider(thickness: 1.5, color: Colors.black54),
            ),
          ],
        ),
      )),
    );
  }
}

Widget biuldHeader(BuildContext context) => Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    );
