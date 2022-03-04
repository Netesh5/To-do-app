import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/model/task.dart';

class Databases {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, task TEXT, time INTEGER)',
        );
      },
      version: 1,
    );
  }

  Future<void> insert_task(Task task) async {
    Database _db = await database();
    await _db.insert("tasks", task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Task>> tasklist() async {
    Database _db = await database();
    List<Map<String, dynamic>> taskmap = await _db.query('tasks');
    return List.generate(taskmap.length, (index) {
      return Task(
        //id: taskmap[index]['id'],
        task: taskmap[index]['task'],
        //time: taskmap[index]['time']
      );
    });
  }
}
