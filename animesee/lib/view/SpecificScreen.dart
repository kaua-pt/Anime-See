import 'package:animesee/model/AnimeDetail.dart';
import 'package:flutter/material.dart';

import '../components/Appbar.dart';
import '../components/DrawerSel.dart';

class SpecificScreen extends StatefulWidget {
  final AnimeDetail anime;

  const SpecificScreen({super.key, required this.anime});

  @override
  State<StatefulWidget> createState() => _SpecificScreen();
}

class _SpecificScreen extends State<SpecificScreen> {
  @override
  Widget build(BuildContext context) {
    var myAnime = widget.anime;

    return Scaffold(
        drawer: DrawerSel(),
        appBar: Appbar(),
        body: Container(
          alignment: Alignment.center,
          color: Colors.black12,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
            child: Expanded(
              child: ListView(scrollDirection: Axis.vertical, children: [
                Center(
                  child: Text(myAnime.animeTitle,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          fontFamily: "Nasalization-rg")),
                ),
                Image.network(myAnime.animeImg,
                    cacheHeight: 300, cacheWidth: 250),
                Text(myAnime.type as String,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: "Nasalization-rg")),
                Text(myAnime.releasedDate,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: "Nasalization-rg")),
                SizedBox(
                  height: 10,
                ),
                Text("Gender: " + myAnime.getGender(),
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontFamily: "Nasalization-rg")),
                SizedBox(
                  height: 10,
                ),
                Text("Total episodes: " + (myAnime.totalEpisodes as String),
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontFamily: "Nasalization-rg")),
                Text("Status: " + (myAnime.status as String),
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontFamily: "Nasalization-rg")),
                SizedBox(
                  height: 10,
                ),
                Text("Synopsis: " + (myAnime.synopsis as String),
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontFamily: "Nasalization-rg"))
              ]),
            ),
          ),
        ));
  }
}
