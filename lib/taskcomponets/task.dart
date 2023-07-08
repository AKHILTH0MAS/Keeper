class Task {
  String taskname;
  String id;
  Task({required this.taskname, required this.id});
  Map<String, dynamic> toJson() => {
        'task': taskname,
      };
  factory Task.fromJson(Map<String, dynamic> json, String id) {
    return Task(
      taskname: json['task'],
      id: id,
    );
  }
  factory Task.toJson(Map<String, dynamic> json, String id) {
    return Task(
      taskname: json['task'],
      id: id,
    );
  }
}
