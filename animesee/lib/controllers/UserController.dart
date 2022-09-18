import 'package:animesee/controllers/MongoDatabase.dart';

import '../model/User.dart';

class UserController {
  final String name;
  final String email;
  final String password;
  final String cPassword;

  UserController(
      {this.name = "",
      required this.email,
      required this.password,
      this.cPassword = ""});

  int registerUser() {
    MongoDatabase.connect("user");
    if (password == cPassword) {
      try {
        MongoDatabase.getOneElement("name", this.email);
      } catch (e) {
        User user = new User(email, name, password);
        return 200;
      }
    }
    return 404;
  }

  int loginUser() {
    MongoDatabase.connect("user");
    try {
      MongoDatabase.getOneElement("email", email).then((value) {
        if (password == value.password) {
          return 200;
        }
      });
    } catch (e) {
      return 404;
    }
    return 204;
  }
}
