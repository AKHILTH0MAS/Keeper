class Note {
  Note({
    required this.title,
    required this.description,
  });
  String title;
  String description;
  String call() {
    return title;
  }

  Note.newconstructor(this.title, this.description) {
    title = title;
    description = description;
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
    };
  }

  Note.fromFirestore(Map<String, dynamic> json)
      : title = json['productId'],
        description = json['productName'];
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
