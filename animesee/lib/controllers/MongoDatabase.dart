import 'dart:html';

import 'package:mongo_dart/mongo_dart.dart';

import '../model/User.dart';

class MongoDatabase {
  static var db, collection;
  static const String url =
      "mongodb+srv://kaua:paradeverminhasenha@cluster0.wtstkeb.mongodb.net/?retryWrites=true&w=majority";

  static connect(String collection) async {
    db = await Db.create(url);
    await db.open();
    collection = db.collection(collection);
  }

  static insert(user) async {
    await collection.insertAll([user.toMap()]);
  }

  static Future<List<Map<String, User>>> getModels() async {
    final users = await collection.find().toList();
    return users;
  }

  static Future<User> getOneElement(String comparative, String name) async {
    User user;
    try {
      user = await collection.findOne(where.eq(comparative, name));
    } catch (e) {
      throw e;
    }
    return user;
  }

  static updateUser(User user) async {
    var us = await collection.findOne({"email": user.email});
    us["name"] = user.name;
    us["email"] = user.email;
    us["password"] = user.password;
    await collection.save(us);
  }

  static deleteUser(User user) async {
    await collection.remove(user.name);
  }
}
