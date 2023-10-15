import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  // Future<UserCredential?> signInWithGoogle() async {
  //   GoogleAuthProvider googleProvider = GoogleAuthProvider();
  //   googleProvider.addScope('https://www.googleapis.com/auth/userinfo.email');
  //   if (kIsWeb) {
  //     return await _auth.signInWithPopup(googleProvider);
  //   } else {
  //     return await _auth.signInWithProvider(googleProvider);
  //   }
  // }


  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      return userCredential;
    } else {
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
    // Future<GoogleSignInAccount?> signInWithGoogle() async {
    //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    //   final GoogleSignInAuthentication? googleAuth =
    //   await googleUser?.authentication;
    //   if (googleAuth != null) {
    //     final credential = GoogleAuthProvider.credential(
    //       accessToken: googleAuth.accessToken,
    //       idToken: googleAuth.idToken,
    //     );
    //   }
    //   return googleUser;
    // }

    // Future<GoogleSignInAccount?> signInWithGoogle(BuildContext context) async {
    //   try {
    //     await _googleSignIn.signOut();
    //     final GoogleSignInAccount? googleSigninAccount = await _googleSignIn.signIn();
    //     if (googleSigninAccount == null) {
    //       return null;
    //     }
    //
    //     // final GoogleSignInAuthentication googleAuth = await googleSigninAccount.authentication;
    //     // final AuthCredential credential = GoogleAuthProvider.credential(
    //     //   accessToken: googleAuth.accessToken,
    //     //   idToken: googleAuth.idToken,
    //     // );
    //     // final UserCredential userCredential = await _auth.signInWithCredential(credential);
    //     // final User? user = userCredential.user;
    //
    //     return googleSigninAccount;
    //   } on PlatformException catch (e) {
    //     if (e.code == 'network_error') {
    //       showSnackbar(context, "Network error: ${e.message}");
    //     } else {
    //       showSnackbar(context, "Error signing in with Google: ${e.message}");
    //     }
    //     return null;
    //   } catch (e) {
    //     showSnackbar(context, "Error signing in with Google: $e");
    //     return null;
    //   }
    // }

  }
}