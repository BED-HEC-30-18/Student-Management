final String tableSubjects = "subjects";

class SubjectFields {
  static final List<String> values = [
    id,
    title,
    color,
    teacher,
  ];

  static final String id = "_id";
  static final String title = "title";
  static final String color = "color";
  static final String teacher = "teacher";
}

class Subject {
  final int? id;
  String title;
  int color;
  String teacher;

  Subject({
    this.id,
    required this.title,
    required this.color,
    required this.teacher,
  });

  factory Subject.fromMap(Map<String, dynamic> json) => new Subject(
        id: json[SubjectFields.id] as int,
        title: json[SubjectFields.title] as String,
        color: json[SubjectFields.color] as int,
        teacher: json[SubjectFields.teacher] as String,
      );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      SubjectFields.id: id,
      SubjectFields.title: title,
      SubjectFields.color: color,
      SubjectFields.teacher: teacher,
    };

    return map;
  }
}
