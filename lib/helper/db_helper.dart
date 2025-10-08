import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todo.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE todo(id INTEGER PRIMARY KEY AUTOINCREMENT, namatodo TEXT, deskripsitodo TEXT, kategori TEXT, iscompleted INTEGER, completedat TEXT, deadline TEXT)',
        );
      },
    );
  }

  Future<int> insertTodo(Map<String, dynamic> todo) async {
    final client = await db;
    return client.insert('todo', todo);
  }

  Future<int> updateTodo(int id, Map<String, dynamic> todo) async {
    final client = await db;
    return client.update('todo', todo, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteTodo(int id) async {
    final client = await db;
    return client.delete('todo', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> getTodos() async {
    final client = await db;
    return client.query('todo', orderBy: 'id DESC');
  }
}
