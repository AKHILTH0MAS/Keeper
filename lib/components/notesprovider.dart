import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notes/components/preference.dart';

class NotesProvider extends ChangeNotifier {
  NotesProvider() {
    titles = sharedPreference?.getStringList('sTitle') ?? [];
    descriptions = sharedPreference?.getStringList('sDescription') ?? [];
  }
  final sharedPreference = PreferencesManager.sharedPreferences;
  List<String> titles = [];
  List<String> descriptions = [];
  List path = [];
  void addnote(title1, description1) {
    titles.add(title1);
    descriptions.add(description1);
    sharedPreference?.setStringList('sTitle', titles);
    sharedPreference?.setStringList('sDescription', descriptions);
    notifyListeners();
  }
}
