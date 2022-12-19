final String tableClassess = "Classess";

class ClassFields {
  static final List<String> values = [
    id,
    subject,
    day,
    type,
    location,
    start,
    end,
  ];

  static final String id = "_id";
  static final String subject = "fk_subject";
  static final String day = "day";
  static final String type = "type";
  static final String location = "location";
  static final String start = "start";
  static final String end = "end";
}

class Classes {
  final int? id;
  final int subject;
  final int day;
  final String type;
  final String location;
  final DateTime start;
  final DateTime end;

  const Classes({
    this.id,
    required this.subject,
    required this.day,
    required this.type,
    required this.location,
    required this.start,
    required this.end,
  });

  Classes copy({
    int? id,
    int? subject,
    int? day,
    String? type,
    String? location,
    DateTime? start,
    DateTime? end,
  }) =>
      Classes(
        id: id ?? this.id,
        subject: subject ?? this.subject,
        day: day ?? this.day,
        type: type ?? this.type,
        location: location ?? this.location,
        start: start ?? this.start,
        end: end ?? this.end,
      );

  static Classes fromJson(Map<String, Object?> json) => Classes(
        id: json[ClassFields.id] as int,
        subject: json[ClassFields.subject] as int,
        day: json[ClassFields.day] as int,
        type: json[ClassFields.type] as String,
        location: json[ClassFields.location] as String,
        start: DateTime.parse(json[ClassFields.start] as String),
        end: DateTime.parse(json[ClassFields.end] as String),
      );

  Map<String, Object?> toJson() => {
        ClassFields.id: id,
        ClassFields.subject: subject,
        ClassFields.day: day,
        ClassFields.type: type,
        ClassFields.location: location,
        ClassFields.start: start.toIso8601String(),
        ClassFields.end: end.toIso8601String(),
      };
}
