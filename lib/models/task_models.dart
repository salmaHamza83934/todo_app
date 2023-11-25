class TaskModel {
  String id;
  String title;
  String description;
  int date;
  String userId;
  bool isDone;

  TaskModel(
      {this.id = '',
      required this.title,
      required this.description,
      required this.date,
      required this.userId,
      this.isDone = false});

  TaskModel.fromjson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['title'],
            description: json['description'],
            date: json['date'],
            userId: json['userId'],
            isDone: json['isDone']);

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'userId': userId,
      'date': date,
      'isDone': isDone
    };
  }
}
