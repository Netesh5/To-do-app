import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/model/task.dart';

const tableName = "Todo";
const columnId = 'Id';
const columnTitle = 'Title';
const columnTask = 'Task';
const columnTime = 'Time';

class DataBase {
  // initalize database
  Database? _database;

  //getter method to check database is created or not
  Future<Database?> get database async {
    //null assignment operator ---> if(_database==null){
    //  _database=await intializedbatase();}
    _database ??= await initalizedatabase();
    return _database;
  }

  Future<Database?> initalizedatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + 'todo.db';
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE dogs(id INTEGER PRIMARY KEY AUTOINCREMENT, Title TEXT, Task Text,Time INTEGER)',
        );
      },
    );
  }

//insert the data
  void insert(Task task) async {
    final db = await this.database;
    final result = await db?.insert(tableName, task.toMap());
    debugPrint("Result : $result");
  }

//retrive the data
  Future<List<Task>?> query() async {
    final db = await this._database;
    final result = await db?.query(tableName);
    return List.generate(result!.length, (index) {
      return Task(
          title: result[index]['title'].toString(),
          task: result[index]['task'].toString(),
          time: result[index]['time'].toString());
    });
  }

//delete the data
  Future<int?> deleteTask(int id) async {
    final db = await this.database;
    await db!.delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
