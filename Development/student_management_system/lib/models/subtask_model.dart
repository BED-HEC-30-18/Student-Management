final String tableSubtasks = "subtasks";

class SubtaskFields {
  static final List<String> values = [
    id,
    title,
    task,
    isDone,
  ];

  static final String id = "_id";
  static final String title = "title";
  static final String task = "fk_task";
  static final String isDone = "done";
}

class Subtask {
  final int? id;
  final String title;
  final int task;
  final bool isDone;

  const Subtask({
    this.id,
    required this.isDone,
    required this.title,
    required this.task,
  });

  Subtask copy({
    int? id,
    String? title,
    int? task,
    bool? isDone,
  }) =>
      Subtask(
        id: id ?? this.id,
        title: title ?? this.title,
        task: task ?? this.task,
        isDone: isDone ?? this.isDone,
      );

  static Subtask fromJson(Map<String, Object?> json) => Subtask(
        id: json[SubtaskFields.id] as int,
        title: json[SubtaskFields.title] as String,
        task: json[SubtaskFields.task] as int,
        isDone: json[SubtaskFields.isDone] == 1,
      );

  Map<String, Object?> toJson() => {
        SubtaskFields.id: id,
        SubtaskFields.title: title,
        SubtaskFields.task: task,
        SubtaskFields.isDone: isDone ? 1 : 0,
      };
}
