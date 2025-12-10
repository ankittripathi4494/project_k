import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database; // normal static baridable

  static Future<Database> get database async {
    if (_database != null) {
      // if initialise already then return that instance
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  static Future<Database> _initDatabase() async {
    // get Database Path means where my database store in my local device
    String databasePath = await getDatabasesPath(); // /data/0/projectk
    String path = join(
      databasePath,
      'projectk.db',
    ); // /data/0/projectk/projectk.db
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE IF NOT EXISTS Users (id INTEGER PRIMARY KEY, fullname TEXT, phone TEXT, email TEXT, dob TEXT, password TEXT, status INTEGER)',
    );
  }


  static Future<int> insert({
    required String table,
    required Map<String, dynamic> values,
  }) async {
    final db = await database;
    return await db.insert(table, values);
  }

  static Future<List<Map<String, dynamic>>> queryAllRows({
    required String table,
  }) async {
    final db = await database;
    return await db.query(table);
  }

   static Future<List<Map<String, dynamic>>> specialQuery({
    required String sql,
  }) async {
    final db = await database;
    return await db.rawQuery(sql);
  }

  static Future<Map<String, dynamic>?> queryRowById({
    required String table,
    required int id,
  }) async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.isNotEmpty ? results.first : null;
  }

  static Future<List<Map<String, dynamic>>> queryRowByClause({
    required String table,
    required String whereClause,
    required List<dynamic> whereArgs,
  }) async {
    final db = await database;
    return await db.query(table, where: whereClause, whereArgs: whereArgs);
  }

  static Future<int> update({
    required String table,
    required Map<String, dynamic> values,
    required String whereClause,
    required List<dynamic> whereArgs,
  }) async {
    final db = await database;
    return await db.update(
      table,
      values,
      where: whereClause,
      whereArgs: whereArgs,
    );
  }

  static Future<int> delete({
    required String table,
    required String whereClause,
    required List<dynamic> whereArgs,
  }) async {
    final db = await database;
    return await db.delete(table, where: whereClause, whereArgs: whereArgs);
  }

  static Future<int> deleteTable({required String table}) async {
    final db = await database;
    return await db.delete(table);
  }

}
