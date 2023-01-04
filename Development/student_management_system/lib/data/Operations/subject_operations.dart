import 'package:student_management_system/data/database.dart';
import 'package:student_management_system/domain/models/subject_model.dart';

// class SubjectOperations {
//   late SubjectOperations subjectOperations;

//   DatabaseRepository dbProvider = DatabaseRepository.instance;

//   Future<Subject> create(Subject Subject) async {
//     final db = await dbProvider.database;

//     final id = await db.insert(tableSubjects, Subject.toJson());
//     return Subject.copy(id: id);
//   }

//   Future<Subject> readSubject(int id) async {
//     final db = await dbProvider.database;

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
//     final db = await dbProvider.database;

//     final orderBy = '${SubjectFields.title} ASC';

//     final result = await db.query(tableSubjects, orderBy: orderBy);

//     return result.map((json) => Subject.fromJson(json)).toList();
//   }

//   Future<int> update(Subject Subject) async {
//     final db = await dbProvider.database;

//     return db.update(
//       tableSubjects,
//       Subject.toJson(),
//       where: '${SubjectFields.id} = ?',
//       whereArgs: [Subject.id],
//     );
//   }

//   Future<int> delete(int id) async {
//     final db = await dbProvider.database;

//     return await db.delete(
//       tableSubjects,
//       where: '${SubjectFields.id} = ?',
//       whereArgs: [id],
//     );
//   }
// }

class SubjectOperations {
  DatabaseRepository dbRepository = DatabaseRepository.instance;

  createSubject(Subject subject) async {
    final db = await dbRepository.database;
    print(subject.title);
    db.insert('$tableSubjects', subject.toMap());
    print('Subject inserted');
  }

  updateSubject(Subject subject) async {
    final db = await dbRepository.database;
    db.update('$tableSubjects', subject.toMap(),
        where: '${SubjectFields.id}=?', whereArgs: [subject.id]);
  }

  deleteSubject(Subject subject) async {
    final db = await dbRepository.database;
    db.delete('$tableSubjects',
        where: '${SubjectFields.id}=?', whereArgs: [subject.id]);
  }

  Future<List<Subject>> getAllSubjects() async {
    final db = await dbRepository.database;
    var allRows = await db.query('$tableSubjects');
    List<Subject> subjects =
        allRows.map((subject) => Subject.fromMap(subject)).toList();
    return subjects;
  }

  Future<List<Subject>> getAllSubjectTitles() async {
    final db = await dbRepository.database;
    var allRows = await db.rawQuery('''
    SELECT ${SubjectFields.title} FROM $tableSubjects 
    ''');
    List<Subject> subjects =
        allRows.map((subject) => Subject.fromMap(subject)).toList();
    return subjects;
  }

  Future<Subject> readSubject(int id) async {
    final db = await dbRepository.database;

    final maps = await db.query(
      tableSubjects,
      columns: SubjectFields.values,
      where: '${SubjectFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Subject.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }
}
