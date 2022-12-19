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
  final String title;
  final int color;
  final String teacher;

  const Subject({
    this.id,
    required this.title,
    required this.color,
    required this.teacher,
  });

  Subject copy({
    int? id,
    String? title,
    int? color,
    String? teacher,
  }) =>
      Subject(
        id: id ?? this.id,
        title: title ?? this.title,
        color: color ?? this.color,
        teacher: teacher ?? this.teacher,
      );

  static Subject fromJson(Map<String, Object?> json) => Subject(
        id: json[SubjectFields.id] as int,
        title: json[SubjectFields.title] as String,
        color: json[SubjectFields.color] as int,
        teacher: json[SubjectFields.teacher] as String,
      );

  Map<String, Object?> toJson() => {
        SubjectFields.id: id,
        SubjectFields.title: title,
        SubjectFields.color: color,
        SubjectFields.teacher: teacher,
      };
}
