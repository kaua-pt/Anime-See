import 'dart:convert';
import 'dart:io';

import 'package:animesee/controllers/MongoDatabase.dart';
import 'package:crypto/crypto.dart';

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
    MongoDatabase.connect("users");
    if (password == cPassword) {
      if (MongoDatabase.getOneElement("name", this.email) != null) {
        User user = new User(email, name, password);
        MongoDatabase.insert(user);
        return 200;
      }
    }
    return 404;
  }

  int loginUser() {
    MongoDatabase.connect("users");
    try {
      MongoDatabase.getOneElement("email", email).then((value) async {
        if (password == value.password) {
          var server = await HttpServer.bind(InternetAddress.anyIPv4, 4444);
          server.listen((request) async {
            if (request.uri.path == "/generateToken") {
              request.response.write(UserController.generateToken(value));
            }
          });
          return 200;
        }
      });
    } catch (e) {
      return 404;
    }
    return 204;
  }

  static String generateToken(User user) {
    String secret = "animesee";
    var header = {"alg": "HS256", "typ": "JWT"};
    String header64 = base64Encode(jsonEncode(header).codeUnits);

    var payload = {
      "name": user.name,
      "exp": DateTime.now().millisecondsSinceEpoch + 60000,
    };
    String payload64 = base64Encode(jsonEncode(payload).codeUnits);

    var hmac = Hmac(sha256, secret.codeUnits);
    var digest = hmac.convert("$header64.$payload64".codeUnits);
    String sign = base64Encode(digest.bytes);

    return "$header64.$payload64.$sign";
  }

  static bool testToken(HttpRequest request) {
    String secret = "animesee";

    var token = request.headers["Authorization"]![0].split(" ")[1];
    var tokens = token.split(".");

    String header64 = tokens[0];
    String payload64 = tokens[1];
    Map payload = jsonDecode(utf8.decode(base64Decode(payload64)));
    String sign64 = tokens[2];

    var hmac = Hmac(sha256, secret.codeUnits);
    var digest = hmac.convert("$header64.$payload64".codeUnits);
    String signGlobal = base64Encode(digest.bytes);

    return (sign64 == signGlobal) &&
        (DateTime.now().millisecondsSinceEpoch < payload["exp"]);
  }
}
