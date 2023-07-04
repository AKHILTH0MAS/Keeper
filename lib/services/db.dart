import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes/notescomponents/notesclass.dart';

class DB {
  User? user = FirebaseAuth.instance.currentUser;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> saveNote(Note note) async {
    await _firestore
        .collection('Users')
        .doc(user!.uid)
        .collection('Notes')
        .add(note.toJson());
  }

  Stream<List<Note>> readNotes() {
    return _firestore
        .collection("Users/${user!.uid}/Notes")
        .snapshots()
        .map((qs) {
      if (qs.docs.isEmpty) return [];

      return qs.docs.map((e) => Note.fromJson(e.data())).toList();
    });
  }
}
