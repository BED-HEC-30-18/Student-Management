import 'package:student_management_system/database/database.dart';
import 'package:student_management_system/models/class_model.dart';
import 'package:student_management_system/models/subject_model.dart';

class PeriodOperations {
  DatabaseRepository dbRepository = DatabaseRepository.instance;

  createPeriod(Period period) async {
    final db = await dbRepository.database;
    print(period.subject);
    db.insert('$tablePeriods', period.toMap());
    print('Period inserted');
  }

  updatePeriod(Period period) async {
    final db = await dbRepository.database;
    db.update('$tablePeriods', period.toMap(),
        where: '${PeriodFields.id}=?', whereArgs: [period.id]);
  }

  deletePeriod(Period period) async {
    final db = await dbRepository.database;
    db.delete('$tablePeriods',
        where: '${PeriodFields.id}=?', whereArgs: [period.id]);
  }

  Future<List<Period>> getAllPeriods(int lane) async {
    final db = await dbRepository.database;
    var allRows = await db.rawQuery('''
    SELECT * FROM $tablePeriods 
    WHERE ${PeriodFields.day} = $lane
    ''');

    List<Period> periods =
        allRows.map((period) => Period.fromMap(period)).toList();
    return periods;
  }

  Future<Period> readPeriod(int id) async {
    final db = await dbRepository.database;

    final maps = await db.query(
      tablePeriods,
      columns: PeriodFields.values,
      where: '${PeriodFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Period.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  getSubject(Period period) async {
    final db = await dbRepository.database;
    final maps = await db.rawQuery('''
    SELECT * FROM $tableSubjects 
    WHERE _id = ${period.subject}
    ''');
    if (maps.isNotEmpty) {
      return Subject.fromMap(maps.first);
    } else {
      throw Exception('ID ${period.subject} not found');
    }
  }
}
