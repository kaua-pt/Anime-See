import 'package:animesee/services/DbFirestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/User.dart';

class FavoriteService {
  late FirebaseFirestore db;

  void verifyStar(String animeId, User user) {}

  void starAnime(String animeId, User user) async {
    db = await DbFirestore.get();

    final snapshot = await db
        .collection("/favorites/")
        .where({"user": user, "anime": animeId}).get();

    if (snapshot.docs.isEmpty) {
      await db
          .collection("/favorites/")
          .doc()
          .set({"user": user, "anime": animeId});
    } else {
      // remove
    }
  }
}
