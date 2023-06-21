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
  bool isDarktheme = true;
  List<String> titles = [];
  List<String> descriptions = [];
  List<String> path = [];
  List<String> tasks = [];
  List<String> notesresultstitles = [];
  List<String> notesresultsdescriptions = [];
  List<String> tasksresults = [];

  void darkTheme() {
    isDarktheme = !isDarktheme;
    notifyListeners();
  }

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
    sharedPreference?.setStringList('sTask', tasks);
    notifyListeners();
  }

  void searchNotes(String keyword) {
    notesresultstitles.clear();
    notesresultsdescriptions.clear();
    for (int index = 0; index < titles.length; index++) {
      if (titles[index].toLowerCase().contains(keyword.toLowerCase())) {
        notesresultstitles.add(titles[index]);
        notesresultsdescriptions.add(descriptions[index]);
        // notifyListeners();
      }
    }
  }

  void searchTasks(String keyword) {
    tasksresults.clear();
    for (int index = 0; index < tasks.length; index++) {
      if (tasks[index].toLowerCase().contains(keyword.toLowerCase())) {
        tasksresults.add(tasks[index]);
        // notifyListeners();
      }
    }
  }

  void addbulletnote(
    title,
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
    titles.add(title);
    descriptions.add(description);
    sharedPreference?.setStringList('sTitle', titles);
    sharedPreference?.setStringList('sDescription', descriptions);
    notifyListeners();
  }
}
