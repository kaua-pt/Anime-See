import 'package:animesee/model/Popular.dart';
import 'package:animesee/repositories/AnimeRepositories.dart';
import 'package:animesee/view/SpecificScreen.dart';

import 'package:flutter/material.dart';

class ScroolRow extends StatefulWidget {
  final String title;
  final List list;

  ScroolRow({super.key, required this.list, required this.title});

  @override
  State<ScroolRow> createState() => _ScroolRowState();
}

class _ScroolRowState extends State<ScroolRow> {
  AnimeRepositories apiL = AnimeRepositories();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.widget.title,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontFamily: "Nasalization-rg"),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.list.length,
              itemBuilder: ((context, index) {
                Popular anime = widget.list[index];
                return GestureDetector(
                  onTap: () async {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please wait while we load the page")));
                    await apiL.fetchDetail(anime.animeId as String);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => SpecificScreen(
                                  anime: apiL.returnAnime.last,
                                  animeId: anime.animeId as String,
                                ))));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 100,
                      child: Column(
                        children: [
                          Image.network(
                            anime.animeImg,
                            cacheHeight: 130,
                            cacheWidth: 100,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          SizedBox(
                            height: 50,
                            child: Text(anime.animeTitle,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                    fontFamily: "Nasalization-rg")),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
