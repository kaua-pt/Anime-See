import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static connect(collection) async {
    var db = await Db.create("");
    await db.open();
    var userCollection = db.collection("");
  }
}
