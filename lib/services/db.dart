import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../notescomponents/notesClass.dart';

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

  Future<List<Note>> readNotes() async {
    final qs = await _firestore
        .collection('Users')
        .doc(user!.uid)
        .collection('Notes')
        .get();
    if (qs.docs.isEmpty) return [];
    List<Map<String, dynamic>> jsonNotes;
    jsonNotes = qs.docs.map((e) => e.data()).toList();
    List<Note> notes = [];

    return notes;
  }
}
