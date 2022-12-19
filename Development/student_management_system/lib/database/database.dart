import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/class_model.dart';
import '../models/subject_model.dart';
import '../models/subtask_model.dart';
import '../models/task_model.dart';

class DatabaseRepository {
  DatabaseRepository._privateConstructor();

  static final DatabaseRepository instance =
      DatabaseRepository._privateConstructor();

  final _databaseName = 'database.db';
  final _databaseVersion = 1;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documents = await getApplicationDocumentsDirectory();
    String path = join(documents.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    final doubleType = 'DOUBLE NOT NULL';

    await db.execute('''
// CREATE TABLE $tableSubjects (
//   ${SubjectFields.id} $idType,
//   ${SubjectFields.title} $textType,
//   ${SubjectFields.color} $integerType,
//   ${SubjectFields.teacher} $textType,
//   )
''');

// Exception has occurred.
// SqfliteDatabaseException (DatabaseException(near ")": syntax error (code 1 SQLITE_ERROR): , while compiling: CREATE TABLE subjects (
//   _id INTEGER PRIMARY KEY AUTOINCREMENT,
//   title TEXT NOT NULL,
//   color INTEGER NOT NULL,
//   teacher TEXT NOT NULL,
//   )) sql 'CREATE TABLE subjects (
//   _id INTEGER PRIMARY KEY AUTOINCREMENT,
//   title TEXT NOT NULL,
//   color INTEGER NOT NULL,
//   teacher TEXT NOT NULL,
//   )
// ' args [])

//     await db.execute('''
// CREATE TABLE $tableClassess (
//   ${ClassFields.id} $idType,
//   ${ClassFields.subject} $integerType,
//   ${ClassFields.day} $integerType,
//   ${ClassFields.type} $textType,
//   ${ClassFields.location} $textType,
//   ${ClassFields.start} $textType,
//   ${ClassFields.end} $textType,
//   FOREIGN KEY (${ClassFields.subject}) REFERENCES $tableSubjects (${SubjectFields.id})
//   )
// ''');
//     await db.execute('''
// CREATE TABLE $tableTasks (
//   ${TaskFields.id} $idType,
//   ${TaskFields.title} $textType,
//   ${TaskFields.subject} $integerType,
//   ${TaskFields.type} $textType,
//   ${TaskFields.note} $textType,
//   ${TaskFields.time} $textType,
//   ${TaskFields.date} $textType,
//   ${TaskFields.repeat} $textType,
//   ${TaskFields.notification} $textType,
//   ${TaskFields.grade} $integerType,
//   ${TaskFields.weight} $doubleType,
//   FOREIGN KEY (${TaskFields.subject}) REFERENCES $tableSubjects (${SubjectFields.id})
//   )
// ''');
//     await db.execute('''
// CREATE TABLE $tableSubtasks (
//   ${SubtaskFields.id} $idType,
//   ${SubtaskFields.title} $textType,
//   ${SubtaskFields.task} $integerType,
//   ${SubtaskFields.isDone} $boolType,
//   FOREIGN KEY (${SubtaskFields.task}) REFERENCES $tableTasks (${TaskFields.id})
//   )
// ''');
  }

  Future<Subject> create(Subject subject) async {
    final db = await instance.database;

    final id = await db.insert(tableSubjects, subject.toJson());
    return subject.copy(id: id);
  }

  Future<Subject> readSubject(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableSubjects,
      columns: SubjectFields.values,
      where: '${SubjectFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Subject.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Subject>> readAllSubjects() async {
    final db = await instance.database;

    final orderBy = '${SubjectFields.title} ASC';

    final result = await db.query(tableSubjects, orderBy: orderBy);

    return result.map((json) => Subject.fromJson(json)).toList();
  }

  Future<int> update(Subject subject) async {
    final db = await instance.database;

    return db.update(
      tableSubjects,
      subject.toJson(),
      where: '${SubjectFields.id} = ?',
      whereArgs: [subject.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableSubjects,
      where: '${SubjectFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
