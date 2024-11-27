import 'package:firebase_auth/firebase_auth.dart';

import '../../data/auth_data.dart';

class AuthRepository {
  final AuthDataSource _authDataSource = AuthDataSource();

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    return await _authDataSource.signInWithEmailAndPassword(email, password);
  }

  Future<UserCredential> signUpWithEmailAndPassword(String email, String password) async {
    return await _authDataSource.signUpWithEmailAndPassword(email, password);
  }

  Future<UserCredential> signInWithGoogle() async {
    return await _authDataSource.signInWithGoogle();
  }

  Future<void> signOut() async {
    await _authDataSource.signOut();
  }
}
