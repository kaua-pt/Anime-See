import 'package:animesee/model/AnimeDetail.dart';
import 'package:animesee/services/FavoriteService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/Appbar.dart';
import '../components/DrawerSel.dart';
import '../model/Popular.dart';
import '../services/AuthService.dart';

class SpecificScreen extends StatefulWidget {
  final AnimeDetail anime;
  final String animeId;

  const SpecificScreen({super.key, required this.anime, required this.animeId});

  @override
  State<StatefulWidget> createState() => _SpecificScreen();
}

class _SpecificScreen extends State<SpecificScreen> {
  @override
  Widget build(BuildContext context) {
    var myAnime = widget.anime;
    Stream<bool>? isFavorite;
    AuthService auth = Provider.of<AuthService>(context);
    FavoriteService star = FavoriteService();
    isFavorite = star.verifyStar(widget.animeId, auth.user?.email as String);

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
                Stack(alignment: Alignment.topRight, children: [
                  (auth.user != null
                      ? StreamBuilder<bool?>(
                          stream: isFavorite,
                          builder: (context, snapshot) {
                            return ListTile(
                                title: Text(
                                  myAnime.animeTitle,
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black87,
                                    fontFamily: "Nasalization-rg",
                                  ),
                                  textWidthBasis: TextWidthBasis.parent,
                                ),
                                trailing: IconButton(
                                    icon: Icon(
                                      Icons.favorite,
                                      color: (snapshot.data == true)
                                          ? Colors.red
                                          : Colors.black87,
                                    ),
                                    onPressed: () => {
                                          (snapshot.data == true)
                                              ? star.unStarAnime(widget.animeId,
                                                  auth.user?.email as String)
                                              : star.starAnime(
                                                  widget.animeId,
                                                  auth.user?.email as String,
                                                  myAnime),
                                          setState(() {
                                            isFavorite = star.verifyStar(
                                              widget.animeId,
                                              auth.user?.email as String,
                                            );
                                          })
                                        }));
                          })
                      : SizedBox()),
                ]),
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
                        fontFamily: "Nasalization-rg")),
              ]),
            ),
          ),
        ));
  }
}
