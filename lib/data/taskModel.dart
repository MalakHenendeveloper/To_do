class Tasks {
  String title;
  String descraption;
  DateTime dateTime;
  bool isDone;
  String id;
  Tasks(
      {this.id = '',
      required this.title,
      required this.dateTime,
      required this.descraption,
      this.isDone = false});
  Tasks.fromfirestore(Map<String, dynamic> data)
      : this(
            id: data['id'] as String,
            descraption: data['descraption'] as String,
            isDone: data['isDone'] != null ? data['isDone'] as bool : false,
            title: data['title'] as String,
            dateTime: DateTime.fromMillisecondsSinceEpoch(data['datetime']));
  Map<String, dynamic> toFireTore() {
    return {
      'id': id,
      'isDone': isDone,
      "title": title,
      "datetime": dateTime.millisecondsSinceEpoch,
      'descraption': descraption
    };
  }
}
