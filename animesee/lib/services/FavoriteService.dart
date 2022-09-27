import 'package:animesee/model/AnimeDetail.dart';
import 'package:animesee/services/DbFirestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/Popular.dart';

late bool helper = false;

class FavoriteService {
  late FirebaseFirestore db;
  late bool flag = false;
  late List<AnimeDetail> list = [];

  Stream<bool> verifyStar(String animeId, String userEmail) async* {
    bool result = false;
    db = await DbFirestore.get();

    await db.collection("/favorites").get().then((snapshot) {
      for (var snap in snapshot.docs) {
        if (snap.data()['anime'] == animeId &&
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

  void starAnime(String animeId, String userEmail) async {
    db = await DbFirestore.get();
    await db
        .collection("/favorites")
        .add({"user": userEmail, "anime": animeId});
  }

  void unStarAnime(String animeId, String userEmail) async {
    flag = true;
    db = await DbFirestore.get();
    await db.collection("/favorites").get().then((snapshot) {
      for (var snap in snapshot.docs) {
        (snap.data()['anime'] == animeId && snap.data()['user'] == userEmail)
            ? (db.collection("/favorites").doc(snap.id).delete())
            : null;
      }
    });
  }

  void fetchFavorites(String userName) async {
    db = await DbFirestore.get();

    await db.collection("/favorites").get().then((snapshot) {
      for (var snap in snapshot.docs) {
        if (snap.data()['user'] == userName) {
          // anime detail add
        }
      }
    });
  }

  List getFav() {
    return list;
  }
}
