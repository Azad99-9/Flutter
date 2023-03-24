import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:journal/models/journal.dart';
import 'package:journal/services/db_firestore_api.dart';

class DbFireStoreService implements DbApi {
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  String _collectionJournal = 'journals';

  Stream<List<Journal>> getJournalList(String? uid) {
    return _fireStore
        .collection(_collectionJournal)
        .where('uid', isEqualTo: uid)
        .snapshots()
        .map((snapshot) {
      List<Journal> _journalDocs = snapshot.docs
          .map((doc) => Journal.fromDoc(doc.data(), doc.id))
          .toList();
      _journalDocs.sort((comp1, comp2) => comp2.date!.compareTo(comp1.date!));
      return _journalDocs;
    });
  }

  Future<Journal> getJournal(String? documentID) async {
    DocumentReference _documentReference =
        _fireStore.collection(_collectionJournal).doc(documentID);
    return Journal.fromDoc(
        await _documentReference.get().then((doc) => doc.data()), documentID);
  }

  Future<bool> addJournal(Journal journal) async {
    DocumentReference _documentReference =
        await _fireStore.collection(_collectionJournal).add({
      'date': journal.date,
      'mood': journal.mood,
      'note': journal.note,
      'uid': journal.uid,
    });
    return _documentReference.id != null;
  }

  void updateJournal(Journal journal) async {
    await _fireStore
        .collection(_collectionJournal)
        .doc(journal.documentID)
        .update({
      'date': journal.date,
      'mood': journal.mood,
      'note': journal.note,
    }).catchError((error) => print('Error updating: $error'));
  }

  void deleteJournal(Journal journal) async {
    await _fireStore
        .collection(_collectionJournal)
        .doc(journal.documentID)
        .delete()
        .catchError((error) => print('Error deleting: $error'));
  }
}
