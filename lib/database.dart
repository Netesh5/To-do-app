import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/model/task.dart';

class Databases {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'task.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE task(id INTEGER PRIMARY KEY, task TEXT, time INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insert_task(Task task) async {
    Database _db = await database();
    _db.insert("task", task.data(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
