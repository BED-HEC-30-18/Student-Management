import 'package:student_management_system/database/database.dart';
import '../models/subject_model.dart';
import 'package:sqflite/sqflite.dart';

class SubjectOperations {
  late SubjectOperations subjectOperations;

  DatabaseRepository dbProvider = DatabaseRepository.instance;

  Future<Subject> create(Subject Subject) async {
    final db = await dbProvider.database;

    final id = await db.insert(tableSubjects, Subject.toJson());
    return Subject.copy(id: id);
  }

  Future<Subject> readSubject(int id) async {
    final db = await dbProvider.database;

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
    final db = await dbProvider.database;

    final orderBy = '${SubjectFields.title} ASC';

    final result = await db.query(tableSubjects, orderBy: orderBy);

    return result.map((json) => Subject.fromJson(json)).toList();
  }

  Future<int> update(Subject Subject) async {
    final db = await dbProvider.database;

    return db.update(
      tableSubjects,
      Subject.toJson(),
      where: '${SubjectFields.id} = ?',
      whereArgs: [Subject.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await dbProvider.database;

    return await db.delete(
      tableSubjects,
      where: '${SubjectFields.id} = ?',
      whereArgs: [id],
    );
  }
}
