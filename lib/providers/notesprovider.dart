import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes/notescomponents/preference.dart';

class NotesProvider extends ChangeNotifier {
  NotesProvider() {
    isDarktheme = sharedPreference?.getBool('darktheme') ?? true;
  }

  final sharedPreference = PreferencesManager.sharedPreferences;
  bool isDarktheme = true;
  bool search = true;
  bool emptyNote = false;
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
}
