import 'dart:async';
import 'package:journal/services/authentication_api.dart';

class AuthenticationBloc {
  final AuthenticationApi authenticationApi;
  final StreamController<String?> _authenticationController =
      StreamController<String?>();
  Sink<String?> get addUser => _authenticationController.sink;
  Stream<String?> get user => _authenticationController.stream;

  final StreamController<bool?> _logoutController = StreamController<bool?>();
  Sink<bool?> get logoutUser => _logoutController.sink;
  Stream<bool?> get listenLogoutUser => _logoutController.stream;

  AuthenticationBloc(this.authenticationApi) {
    onAuthChanged();
  }

  void onAuthChanged() {
    authenticationApi.getFirebaseAuth().authStateChanges().listen((user) {
      final String? uid = user?.uid;
      addUser.add(uid);
    });
    listenLogoutUser.listen((logout) {
      if (logout == true) {
        _signOut();
      }
    });
  }

  void dispose() {
    _authenticationController.close();
    _logoutController.close();
  }

  void _signOut() {
    authenticationApi.signOut();
  }
}
