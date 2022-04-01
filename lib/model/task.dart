class Task {
  Task({
    this.id,
    this.title,
    this.task,
    this.time,
  });

  int? id;
  String? title;
  String? task;
  String? time;

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        task: json["task"],
        time: json["time"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "task": task,
      };
}
