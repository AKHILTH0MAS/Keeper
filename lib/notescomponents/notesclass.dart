import 'package:firebase_auth/firebase_auth.dart';

class Note {
  Note({
    required this.title,
    required this.description,
  });
  String uid = FirebaseAuth.instance.currentUser!.uid;
  String title;
  String description;
  String call() {
    return title;
  }

  Note.newconstructor(this.title, this.description) {
    title = title;
    description = description;
  }
  factory Note.fromjson(Map<String, dynamic>? json) {
    return Note(
      title: json!['title'],
      description: json["description"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "title": title,
      "description": description,
    };
  }
}

class Notesbullet {
  String? title;
  String? description1;
  String? description2;
  String? description3;
  String? description4;
  String? description5;
  String? description6;
  String? description7;
}
