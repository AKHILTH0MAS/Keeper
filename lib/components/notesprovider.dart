import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NotesProvider extends ChangeNotifier {
  List<String> title = [];
  List<String> description = [];
  List path = [];
  addnote(title1, description1, path1) {
    title.add(title1);
    description.add(description1);
    path.add(path1);
    notifyListeners();
  }
}
