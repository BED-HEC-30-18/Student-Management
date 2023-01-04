import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future registerWithEmailAndPassword(
    String name, String password, String email) async {
  try {
    UserCredential result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = result.user;
    user!.updateDisplayName(name); //added this line
    // return _user(user);
  } catch (e) {
    print(e.toString());
    return null;
  }
}
