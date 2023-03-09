import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

// class AutServices {
//   signInWithGoogle() async {
//     final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

//     final GoogleSignInAuthentication gAuth = await gUser!.authentication;

//     final credential = GoogleAuthProvider.credential(
//       accessToken: gAuth.accessToken,
//       idToken: gAuth.idToken,
//     );

//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
// }

class AuthServices {
  Future<void> googleSignIn() async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          await FirebaseAuth.instance.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: googleAuth.idToken,
                  accessToken: googleAuth.accessToken));
        } on PlatformException catch (e) {}
      }
    }
  }
}
