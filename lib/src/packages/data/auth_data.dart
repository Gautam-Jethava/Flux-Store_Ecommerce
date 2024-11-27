import 'package:firebase_auth/firebase_auth.dart';
import 'package:flux_store/src/utils/logger.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthDataSource {
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Log.error('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Log.error('Wrong password provided for that user.');
      }
      rethrow;
    }
  }

  Future<UserCredential> signUpWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Log.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Log.error('The account already exists for that email.');
      }
      rethrow;
    } catch (e) {
      Log.error(e);
      rethrow;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
