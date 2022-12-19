import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import '../models/subject_model.dart';

class SubjectsDatabase {
  static final SubjectsDatabase instance = SubjectsDatabase._init();

  static Database? _database;

  SubjectsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('subjects.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableSubjects ( 
  ${SubjectFields.id} $idType, 
  ${SubjectFields.title} $textType,
  ${SubjectFields.color} $integerType,
  ${SubjectFields.teacher} $textType
  )
''');
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
