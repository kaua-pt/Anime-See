import 'dart:developer';

import 'package:animesee/model/Anime.dart';
import 'package:animesee/model/AnimeDetail.dart';
import 'package:animesee/model/Popular.dart';
import 'package:animesee/repositories/AnimeRepositories.dart';
import 'package:animesee/services/DbFirestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

late bool helper = false;

class FavoriteService {
  late FirebaseFirestore db;
  late bool flag = false;
  late List<Popular> listFav = [];
  AnimeRepositories api = AnimeRepositories();

  Stream<bool> verifyStar(String animeId, String userEmail) async* {
    bool result = false;
    db = await DbFirestore.get();

    await db.collection("/favorites").get().then((snapshot) {
      for (var snap in snapshot.docs) {
        if (snap.data()['info']['animeId'] == animeId &&
            snap.data()['user'] == userEmail &&
            helper == false &&
            flag == false) {
          result = true;
          break;
        } else {
          result = false;
        }
      }
    });
    helper = result;
    yield result;
  }

  void starAnime(String animeId, String userEmail, AnimeDetail info) async {
    Popular animePop = Popular(
        animeId: animeId,
        animeImg: info.animeImg,
        animeTitle: info.animeTitle,
        releasedDate: info.releasedDate);
    db = await DbFirestore.get();
    await db
        .collection("/favorites")
        .add({"user": userEmail, "info": animePop.toJson()});
  }

  void unStarAnime(String animeId, String userEmail) async {
    flag = true;
    db = await DbFirestore.get();
    await db.collection("/favorites").get().then((snapshot) {
      for (var snap in snapshot.docs) {
        (snap.data()['info']['animeId'] == animeId &&
                snap.data()['user'] == userEmail)
            ? (db.collection("/favorites").doc(snap.id).delete())
            : null;
      }
    });
  }

  Future fetchFavorites(String userName) async {
    db = await DbFirestore.get();
    await db.collection("/favorites").get().then((snapshot) {
      listFav.clear();
      for (var snap in snapshot.docs) {
        if (snap.data()['user'] == userName) {
          Popular popular = Popular.fromJson(snap.data()['info']);
          listFav.add(popular);
        }
      }
    });
  }

  List<Popular> getFav() {
    return listFav;
  }
}
