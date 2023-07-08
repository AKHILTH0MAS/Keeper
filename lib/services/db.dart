import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notes/notescomponents/notesclass.dart';

import '../taskcomponets/task.dart';

class DB {
  User? user = FirebaseAuth.instance.currentUser;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> saveNote(String title, String description) async {
    Note note = Note(title: title, description: description, id: "");

    await _firestore
        .collection('Users')
        .doc(user!.uid)
        .collection('Notes')
        .add(note.toJson());
  }

  Future<void> saveTask(String taskdata) async {
    Task task = Task(taskname: taskdata, id: "");
    await _firestore
        .collection('Users')
        .doc(user!.uid)
        .collection('Tasks')
        .add(task.toJson());
  }

  Stream<List<Task>> readTasks() {
    return _firestore
        .collection("Users/${user!.uid}/Tasks")
        .snapshots()
        .map((qs) {
      if (qs.docs.isEmpty) return [];

      return qs.docs.map((e) => Task.fromJson(e.data(), e.id)).toList();
    });
  }

  Stream<List<Note>> readNotes() {
    return _firestore
        .collection("Users/${user!.uid}/Notes")
        .snapshots()
        .map((qs) {
      if (qs.docs.isEmpty) return [];

      return qs.docs.map((e) => Note.fromJson(e.data(), e.id)).toList();
    });
  }

  void deletetask(Task task) async {
    await _firestore
        .collection('Users')
        .doc(user!.uid)
        .collection('Tasks')
        .doc(task.id)
        .delete();
  }

  void deletenote(Note note) async {
    await _firestore
        .collection('Users')
        .doc(user!.uid)
        .collection('Notes')
        .doc(note.id)
        .delete();
  }

  void addbulletnote(
    String title,
    String note1,
    String note2,
    String note3,
    String note4,
    String note5,
    String note6,
    String note7,
  ) {
    String description = '';
    description = (note1.isNotEmpty) ? '$description•\t$note1\n' : description;
    description = (note2.isNotEmpty) ? '$description•\t$note2\n' : description;
    description = (note3.isNotEmpty) ? '$description•\t$note3\n' : description;
    description = (note4.isNotEmpty) ? '$description•\t$note4\n' : description;
    description = (note5.isNotEmpty) ? '$description•\t$note5\n' : description;
    description = (note6.isNotEmpty) ? '$description•\t$note6\n' : description;
    description = (note7.isNotEmpty) ? '$description•\t$note7\n' : description;

    DB().saveNote(title, description);
  }
}
