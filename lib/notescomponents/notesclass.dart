class Note {
  Note({
    required this.id,
    required this.title,
    required this.description,
  });
  String title;
  String description;
  String id;
  String call() {
    return title;
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
    };
  }

  factory Note.fromJson(Map<String, dynamic> json, id) {
    return Note(
      id: id,
      title: json["title"],
      description: json["description"],
    );
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
