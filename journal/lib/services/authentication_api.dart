import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationApi {
  FirebaseAuth getFirebaseAuth();
  Future<String?> currentUserUid();
  Future<void> signOut();
  Future<String?> signInWithEmailAndPassword({String? email, String? password});
  Future<String?> createUserWithEmailAndPassword(
      {String? email, String? password});
  Future<void> sendEmailVerification();
  Future<bool?> isEmailVerified();
}
