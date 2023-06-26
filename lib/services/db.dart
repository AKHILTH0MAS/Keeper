import 'package:cloud_firestore/cloud_firestore.dart';

import '../notescomponents/notesClass.dart';

class DB {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> saveNote(Note note) async {
    await _firestore.collection('notes').add(note.toJson());
  }

  Future<Note?> readNote({String? noteid}) async {
    final doc = await _firestore.collection('notes').doc(noteid).get();
    final data = doc.data();
    if (doc.exists) return null;
    return Note.fromjson(data);
  }
}
