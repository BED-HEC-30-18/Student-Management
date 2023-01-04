import 'package:student_management_system/data/database.dart';
import 'package:student_management_system/domain/models/subject_model.dart';
import 'package:student_management_system/domain/models/task_model.dart';

class TaskOperations {
  DatabaseRepository dbRepository = DatabaseRepository.instance;

  createTask(Task task) async {
    final db = await dbRepository.database;
    print(task.subject);
    db.insert('$tableTasks', task.toMap());
    print('Task inserted');
  }

  updateTask(Task task) async {
    final db = await dbRepository.database;
    db.update('$tableTasks', task.toMap(),
        where: '${TaskFields.id}=?', whereArgs: [task.id]);
  }

  deleteTask(Task task) async {
    final db = await dbRepository.database;
    db.delete('$tableTasks', where: '${TaskFields.id}=?', whereArgs: [task.id]);
  }

  // Future<List<Task>> getAllTasks(DateTime date) async {
  //   final db = await dbRepository.database;
  //   var allRows = await db.rawQuery('''
  //   SELECT * FROM $tableTasks
  //   WHERE ${TaskFields.date} = $date
  //   ''');

  //   List<Task> tasks = allRows.map((task) => Task.fromMap(task)).toList();
  //   return tasks;
  // }

  Future<List<Task>> getAllTasks(DateTime dateTime) async {
    final db = await dbRepository.database;
    List<Map<String, dynamic>> taskMaps = await db.rawQuery(
        'SELECT * FROM $tableTasks WHERE DATE(${TaskFields.date}) = DATE(?)',
        [dateTime.toString()]);

    List<Task> tasks = [];
    for (final taskMap in taskMaps) {
      tasks.add(Task.fromMap(taskMap));
    }
    if (tasks.isNotEmpty) {
      return tasks;
    }
    return [];
  }

  Future<Task> readTask(int id) async {
    final db = await dbRepository.database;

    final maps = await db.query(
      tableTasks,
      columns: TaskFields.values,
      where: '${TaskFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Task.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  getSubject(Task task) async {
    final db = await dbRepository.database;
    final maps = await db.rawQuery('''
    SELECT * FROM $tableSubjects 
    WHERE _id = ${task.subject}
    ''');
    if (maps.isNotEmpty) {
      return Subject.fromMap(maps.first);
    } else {
      throw Exception('ID ${task.subject} not found');
    }
  }
}
