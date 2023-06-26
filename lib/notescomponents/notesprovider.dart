import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes/notescomponents/preference.dart';

import '../services/db.dart';
import 'notesClass.dart';

class NotesProvider extends ChangeNotifier {
  NotesProvider() {
    notes = [];
    tasks = sharedPreference?.getStringList('sTask') ?? [];
    isDarktheme = sharedPreference?.getBool('darktheme') ?? true;
  }

  final sharedPreference = PreferencesManager.sharedPreferences;
  bool isDarktheme = true;
  bool search = true;
  bool emptyNote = false;
  List<Note> notes = [];
  List<String> tasks = [];
  List<Note> notesresults = [];
  List<String> tasksresults = [];

  void searchbool() {
    search = !search;
    notifyListeners();
  }

  void darkTheme() {
    isDarktheme = !isDarktheme;
    sharedPreference?.setBool('darktheme', isDarktheme);
    notifyListeners();
  }

  void addnote(String title, String description) {
    Note note = Note.newconstructor(title, description);
    notes.add(note);
    notifyListeners();
    DB().saveNote(note);
  }

  void deletenote(note) {
    notes.remove(note);
    notifyListeners();
  }

  void addTask(String task) {
    tasks.add(task);
    sharedPreference?.setStringList('sTask', tasks);
    notifyListeners();
  }

  void deleteTask(String task) {
    tasks.remove(task);
    sharedPreference?.setStringList('sTask', tasks);
    notifyListeners();
  }

  void searchNotes(String keyword) {
    notesresults.clear();
    for (int index = 0; index < notes.length; index++) {
      if (notes[index].call().toLowerCase().contains(keyword.toLowerCase())) {
        notesresults.add(notes[index]);
        notifyListeners();
      }
    }
  }

  void searchTasks(String keyword) {
    tasksresults.clear();
    for (int index = 0; index < tasks.length; index++) {
      if (tasks[index].toLowerCase().contains(keyword.toLowerCase())) {
        tasksresults.add(tasks[index]);
        notifyListeners();
      }
    }
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
    String description =
        '•\t$note1\n•\t$note2\n•\t$note3\n•\t$note4\n•\t$note5\n•\t$note6\n•\t$note7';
    Note note = Note.newconstructor(title, description);
    notes.add(note);

    notifyListeners();
  }
}
