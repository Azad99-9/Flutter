import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String?, String?>.fromHandlers(
      handleData: (email, sink) {
    if (email != null && email.contains('@') && email.contains('.')) {
      sink.add(email);
    } else if (email != null && email.length > 0) {
      sink.addError('Enter a valid email');
    }
  });

  final validatePassword = StreamTransformer<String?, String?>.fromHandlers(
      handleData: (password, sink) {
    if (password != null && password.length >= 6) {
      sink.add(password);
    } else if (password != null && password.length > 0) {
      sink.addError('Password nees to be at least 6 characters');
    }
  });
}
