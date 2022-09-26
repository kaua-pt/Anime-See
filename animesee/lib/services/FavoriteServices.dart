import 'package:animesee/services/DbFirestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/User.dart';

class FavoriteService {
  late FirebaseFirestore db;
  bool _isFavorite = true;

  Stream<bool> verifyStar(String animeId, String userEmail) async* {
    db = await DbFirestore.get();
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
        db.collection("/favorites/").snapshots();

    bool result = await snapshot.contains({animeId, userEmail});
    print("$result");
    print("$animeId");
    _isFavorite = result;
    yield result;
  }

  void starAnime(String animeId, String userEmail) async {
    db = await DbFirestore.get();
    await db
        .collection("/favorites/")
        .add({"user": userEmail, "anime": animeId});
  }

  void removeStar() async {
    db = await DbFirestore.get();
  }

  bool getFav() {
    return _isFavorite;
  }
}
