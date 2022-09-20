import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isLoading = true;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    _auth.authStateChanges().listen((User? userL) {
      user = (userL == null) ? null : userL;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    user = _auth.currentUser;
    notifyListeners();
  }

  register(String email, String password, String passwordC) async {
    try {
      if (password == passwordC) {
        print("na funcao");
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        throw AuthException("Weak Password");
      } else if (e.code == "email-already-in-use") {
        throw AuthException("Email already in use");
      }
    }
  }

  login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _getUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        throw AuthException("Email not found");
      } else if (e.code == "wrong-password") {
        throw AuthException("Wrong password");
      }
    }
  }

  logout() async {
    await _auth.signOut();
    _getUser();
  }
}

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}
