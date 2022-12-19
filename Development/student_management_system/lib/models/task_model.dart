final String tableTasks = "tasks";

class TaskFields {
  static final List<String> values = [
    id,
    title,
    subject,
    type,
    note,
    time,
    date,
    repeat,
    notification,
    grade,
    weight,
  ];

  static final String id = "_id";
  static final String title = "title";
  static final String subject = "fk_subject";
  static final String type = "type";
  static final String note = "note";
  static final String time = "time";
  static final String date = "date";
  static final String repeat = "repeat";
  static final String notification = "notification";
  static final String grade = "grade";
  static final String weight = "weight";
}

class Task {
  final int? id;
  final String title;
  final int subject;
  final String type;
  final String note;
  final DateTime time;
  final DateTime date;
  final String repeat;
  final String notification;
  final int grade;
  final double weight;

  const Task({
    this.id,
    required this.title,
    required this.subject,
    required this.type,
    required this.note,
    required this.time,
    required this.date,
    required this.repeat,
    required this.notification,
    required this.grade,
    required this.weight,
  });

  Task copy({
    int? id,
    String? title,
    int? subject,
    String? type,
    String? note,
    DateTime? time,
    DateTime? date,
    String? repeat,
    String? notification,
    int? grade,
    double? weight,
  }) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        subject: subject ?? this.subject,
        type: type ?? this.type,
        note: note ?? this.note,
        time: time ?? this.time,
        date: date ?? this.date,
        repeat: repeat ?? this.repeat,
        notification: notification ?? this.notification,
        grade: grade ?? this.grade,
        weight: weight ?? this.weight,
      );

  static Task fromJson(Map<String, Object?> json) => Task(
        id: json[TaskFields.id] as int,
        title: json[TaskFields.title] as String,
        subject: json[TaskFields.subject] as int,
        type: json[TaskFields.type] as String,
        note: json[TaskFields.note] as String,
        time: DateTime.parse(json[TaskFields.time] as String),
        date: DateTime.parse(json[TaskFields.date] as String),
        repeat: json[TaskFields.repeat] as String,
        notification: json[TaskFields.notification] as String,
        grade: json[TaskFields.grade] as int,
        weight: json[TaskFields.weight] as double,
      );

  Map<String, Object?> toJson() => {
        TaskFields.id: id,
        TaskFields.title: title,
        TaskFields.subject: subject,
        TaskFields.type: type,
        TaskFields.note: note,
        TaskFields.time: time.toIso8601String(),
        TaskFields.date: date.toIso8601String(),
        TaskFields.repeat: repeat,
        TaskFields.notification: notification,
        TaskFields.grade: grade,
        TaskFields.weight: weight,
      };
}
