import 'package:firebase_auth/firebase_auth.dart';
import 'package:journal/services/authentication_api.dart';

class AuthenticationService implements AuthenticationApi {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseAuth getFirebaseAuth() {
    return _firebaseAuth;
  }

  Future<String?> currentUserUid() async {
    User user = await _firebaseAuth.currentUser!;
    return user.uid;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<String?> signInWithEmailAndPassword(
      {String? email, String? password}) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email!, password: password!);
    return userCredential.user?.uid;
  }

  Future<String?> createUserWithEmailAndPassword(
      {String? email, String? password}) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email!, password: password!);
    return userCredential.user!.uid;
  }

  Future<void> sendEmailVerification() async {
    User user = await _firebaseAuth.currentUser!;
    user.sendEmailVerification();
  }

  Future<bool?> isEmailVerified() async {
    User user = await _firebaseAuth.currentUser!;
    return user.emailVerified;
  }
}
