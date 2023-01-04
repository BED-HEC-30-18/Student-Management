import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInProvider extends ChangeNotifier {
  Future signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance
          .login(permissions: ['email', 'public_profile', 'user_birthday']);

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      final userData = await FacebookAuth.instance.getUserData();

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      print(e.toString());
    }

    notifyListeners();
  }

  Future logout() async {
    FirebaseAuth.instance.signOut();
  }
}
