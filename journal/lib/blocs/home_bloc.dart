import 'dart:async';
import 'package:journal/services/authentication_api.dart';
import 'package:journal/services/db_firestore_api.dart';
import 'package:journal/models/journal.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeBloc {
  final DbApi dbApi;
  final AuthenticationApi authenticationApi;

  final StreamController<List<Journal>> _journalController =
      StreamController<List<Journal>>.broadcast();
  Sink<List<Journal>> get _addListJournal => _journalController.sink;
  Stream<List<Journal>> get listJournal => _journalController.stream;

  final StreamController<Journal> _journalDeleteController =
      StreamController<Journal>.broadcast();
  Sink<Journal> get deleteJournal => _journalDeleteController.sink;

  HomeBloc(this.dbApi, this.authenticationApi) {
    _startListeners();
  }

  void dispose() {
    _journalController.close();
    _journalDeleteController.close();
  }

  _startListeners() async {
    // Retrieve Firestore Journal Records as List<Journal> not DocumentSnapshot
    User? user = await authenticationApi.getFirebaseAuth().currentUser;
    dbApi.getJournalList(user?.uid).listen((journalDocs) {
      _addListJournal.add(journalDocs);
    });

    _journalDeleteController.stream.listen((journal) {
      dbApi.deleteJournal(journal);
    });

    // authenticationApi.getFirebaseAuth().currentUser().then((user) {
    //   dbApi.getJournalList(user.uid).listen((journalDocs) {
    //     _addListJournal.add(journalDocs);
    //   });

    //   _journalDeleteController.stream.listen((journal) {
    //     dbApi.deleteJournal(journal);
    //   });
    // });
  }
}
