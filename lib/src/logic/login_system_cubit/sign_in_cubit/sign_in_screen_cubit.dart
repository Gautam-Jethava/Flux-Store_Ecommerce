import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/utils/logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../packages/domain/repositories/auth_repository.dart';

part 'sign_in_screen_state.dart';

class SignInScreenCubit extends Cubit<SignInScreenState> {
  SignInScreenCubit() : super(const SignInScreenState(false));

  //
  // final SupabaseClient _supabase = Supabase.instance.client;
  //
  // Future<AuthResponse> signInWithEmailPassword(String email, String password) async {
  //   return await _supabase.auth.signInWithPassword(password: password, email: email);
  // }
  //
  // Future<AuthResponse> signUpWithEmailPassword(String email, String password) async {
  //   return await _supabase.auth.signUp(password: password, email: email);
  // }
  //
  // Future<void> logout() async {
  //   await _supabase.auth.signOut();
  // }
  //
  // String? getCurrentUser() {
  //   final session = _supabase.auth.currentSession;
  //   final user = session?.user;
  //   return user?.email;
  // }

  final AuthRepository _authRepository = AuthRepository();

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    //emit(AuthLoading());
    try {
      await _authRepository.signInWithEmailAndPassword(email, password);
      emit(state.copyWith(userSignIn: true));
    } on FirebaseAuthException catch (e) {
      //emit(AuthFailure(e.message!));
      Log.error(e.message);
    }
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    //emit(AuthLoading());
    try {
      await _authRepository.signUpWithEmailAndPassword(email, password);
      emit(state.copyWith(userSignIn: true));
    } on FirebaseAuthException catch (e) {
      Log.error(e.message);
    }
  }

  Future<void> signInWithGoogle() async {
    //emit(AuthLoading());
    try {
      await _authRepository.signInWithGoogle();
      emit(state.copyWith(userSignIn: true));
    } on FirebaseAuthException catch (e) {
      Log.error(e.message);
    }
  }

  Future<void> signOut() async {
    // emit(AuthLoading());
    try {
      await _authRepository.signOut();
      emit(state.copyWith(userSignIn: true));
    } on FirebaseAuthException catch (e) {
      Log.error(e.message);
    }
  }

  Future<void> signInWithEmailAndPasswordSupabase(String email, String password) async {
    try {
      await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      Log.error(e);
    }
  }
}
