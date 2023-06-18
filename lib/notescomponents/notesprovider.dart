import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes/notescomponents/preference.dart';

class NotesProvider extends ChangeNotifier {
  NotesProvider() {
    titles = sharedPreference?.getStringList('sTitle') ?? [];
    descriptions = sharedPreference?.getStringList('sDescription') ?? [];
    tasks = sharedPreference?.getStringList('sTask') ?? [];
  }

  final sharedPreference = PreferencesManager.sharedPreferences;
  List<String> titles = [];
  List<String> descriptions = [];
  List<String> path = [];
  List<String> tasks = [];
  List<String> notesresultstitles = [];
  List<String> notesresultsdescriptions = [];
  List<String> tasksresults = [];

  void addnote(String title, String description1) {
    titles.add(title);
    descriptions.add(description1);
    sharedPreference?.setStringList('sTitle', titles);
    sharedPreference?.setStringList('sDescription', descriptions);
    notifyListeners();
  }

  void deletenote(String title, String description) {
    titles.remove(title);
    descriptions.remove(description);
    sharedPreference?.setStringList('sTitle', titles);
    sharedPreference?.setStringList('sDescription', descriptions);
    notifyListeners();
  }

  void addTask(String task) {
    tasks.add(task);
    sharedPreference?.setStringList('sTask', tasks);
    notifyListeners();
  }

  void deleteTask(String task) {
    tasks.remove(task);
    notifyListeners();
  }

  void searchNotes(String keyword) {
    notesresultstitles.clear();
    notesresultsdescriptions.clear();
    for (int index = 0; index < titles.length; index++) {
      if (titles[index].toLowerCase().contains(keyword.toLowerCase())) {
        notesresultstitles.add(titles[index]);
        notesresultsdescriptions.add(descriptions[index]);
      }
    }
  }

  void searchTasks(String keyword) {
    tasksresults.clear();
    for (int index = 0; index < tasks.length; index++) {
      if (tasks[index].toLowerCase().contains(keyword.toLowerCase())) {
        tasksresults.add(tasks[index]);
      }
    }
  }
}
