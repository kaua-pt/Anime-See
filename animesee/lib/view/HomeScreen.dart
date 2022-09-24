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

  void initState() {
    super.initState();
    _loadAnimes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSel(),
      appBar: Appbar(),
      body: Container(
          decoration: BoxDecoration(color: Colors.black12),
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 30),
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: 50,
                      maxWidth: 1000,
                      maxHeight: 223,
                      minHeight: 40),
                  child:
                      ScroolRow(list: api.getReturn(), title: "Popular Anime"),
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

  _loadAnimes() async {
    await api.fetchPopular();
  }
}

Widget biuldHeader(BuildContext context) => Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    );
