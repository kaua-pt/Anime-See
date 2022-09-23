import 'package:animesee/model/Anime.dart';
import 'package:animesee/model/Popular.dart';
import 'package:flutter/material.dart';

class ScroolRow extends StatelessWidget {
  final String title;
  final List list;

  ScroolRow({super.key, required this.list, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.title,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontFamily: "Nasalization-rg"),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: ((context, index) {
                Anime anime = list[index];
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, "/contact"),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 100,
                      child: Column(
                        children: [
                          Image.network(anime.animeImg as String,
                              cacheHeight: 130, cacheWidth: 100),
                          SizedBox(
                            height: 2,
                          ),
                          SizedBox(
                            height: 50,
                            child: Text(anime.animeTitle as String,
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
