import 'package:cloud_firestore/cloud_firestore.dart';

class DbFirestore {
  DbFirestore._();
  static final DbFirestore _instance = DbFirestore._();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  static FirebaseFirestore get() {
    return DbFirestore._instance._db;
  }
}
