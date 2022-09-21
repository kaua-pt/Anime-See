import 'package:animesee/model/Anime.dart';
import 'package:flutter/material.dart';

class ScroolRow extends StatelessWidget {
  final String title;
  final List<Anime> list;

  ScroolRow({super.key, required this.list, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.symmetric(horizontal: 24)),
        Text(title,
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: "Nasalization-rg")),
        Container(
          child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                final Anime anime = list[index];
                return GestureDetector(
                  onTap: () => print(anime.animeTitle),
                  child: Stack(children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 130,
                      width: 130,
                      color: Colors.black,
                    )
                  ]),
                );
              }),
              itemCount: list.length),
        )
      ],
    );
  }
}
