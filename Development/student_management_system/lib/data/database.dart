import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../domain/models/class_model.dart';
import '../domain/models/subject_model.dart';
import '../domain/models/subtask_model.dart';
import '../domain/models/task_model.dart';

// Singleton
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
CREATE TABLE $tableSubjects (
  ${SubjectFields.id} $idType,
  ${SubjectFields.title} $textType,
  ${SubjectFields.color} $integerType,
  ${SubjectFields.teacher} $textType
  )
''');

    await db.execute('''
CREATE TABLE $tablePeriods (
  ${PeriodFields.id} $idType,
  ${PeriodFields.subject} $integerType,
  ${PeriodFields.day} $integerType,
  ${PeriodFields.type} $textType,
  ${PeriodFields.location} $textType,
  ${PeriodFields.startH} $integerType,
  ${PeriodFields.endH} $integerType,
  ${PeriodFields.startM} $integerType,
  ${PeriodFields.endM} $integerType,
  FOREIGN KEY (${PeriodFields.subject}) REFERENCES $tableSubjects (${SubjectFields.id})
  )
''');
    await db.execute('''
CREATE TABLE $tableTasks (
  ${TaskFields.id} $idType,
  ${TaskFields.title} $textType,
  ${TaskFields.subject} $integerType,
  ${TaskFields.type} $textType,
  ${TaskFields.note} $textType,
  ${TaskFields.time} $textType,
  ${TaskFields.date} $textType,
  ${TaskFields.repeat} $textType,
  ${TaskFields.notification} $textType,
  ${TaskFields.grade} $integerType,
  ${TaskFields.weight} $doubleType,
  FOREIGN KEY (${TaskFields.subject}) REFERENCES $tableSubjects (${SubjectFields.id})
  )
''');
    await db.execute('''
CREATE TABLE $tableSubtasks (
  ${SubtaskFields.id} $idType,
  ${SubtaskFields.title} $textType,
  ${SubtaskFields.task} $integerType,
  ${SubtaskFields.isDone} $boolType,
  FOREIGN KEY (${SubtaskFields.task}) REFERENCES $tableTasks (${TaskFields.id})
  )
''');
  }

//   Future<Subject> create(Subject subject) async {
//     final db = await instance.database;

//     final id = await db.insert(tableSubjects, subject.toJson());
//     return subject.copy(id: id);
//   }

//   Future<Subject> readSubject(int id) async {
//     final db = await instance.database;

//     final maps = await db.query(
//       tableSubjects,
//       columns: SubjectFields.values,
//       where: '${SubjectFields.id} = ?',
//       whereArgs: [id],
//     );

//     if (maps.isNotEmpty) {
//       return Subject.fromJson(maps.first);
//     } else {
//       throw Exception('ID $id not found');
//     }
//   }

//   Future<List<Subject>> readAllSubjects() async {
//     final db = await instance.database;

//     final orderBy = '${SubjectFields.title} ASC';

//     final result = await db.query(tableSubjects, orderBy: orderBy);

//     return result.map((json) => Subject.fromJson(json)).toList();
//   }

//   Future<int> update(Subject subject) async {
//     final db = await instance.database;

//     return db.update(
//       tableSubjects,
//       subject.toJson(),
//       where: '${SubjectFields.id} = ?',
//       whereArgs: [subject.id],
//     );
//   }

//   Future<int> delete(int id) async {
//     final db = await instance.database;

//     return await db.delete(
//       tableSubjects,
//       where: '${SubjectFields.id} = ?',
//       whereArgs: [id],
//     );
//   }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}

// import 'package:path_provider/path_provider.dart';

// class DatabaseRepository {
//   DatabaseRepository.privateConstructor();

//   static final DatabaseRepository instance =
//       DatabaseRepository.privateConstructor();

//   final _databaseName = 'data.db';
//   final _databaseVersion = 1;

//   static Database? _database;

//   Future<Database> get database async => _database ??= await _initDatabase();

//   Future<Database> _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, _databaseName);
//     return await openDatabase(path,
//         version: _databaseVersion, onCreate: await onCreate);
//   }

//   Future onCreate(Database db, int version) async {
//     await db.execute('''
//           CREATE TABLE subject (
//             subjectId INTEGER PRIMARY KEY AUTOINCREMENT,
//             subjectTitle TEXT NOT NULL,
//             subjectColor INT NOT NULL,
//             subjectTeacher TEXT NOT NULL
//           )
//           ''');
//   }
// }
