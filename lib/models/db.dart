import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'user_hive.dart';

class DbLite {
  DbLite._();

  static final DbLite db = DbLite._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // if _database is null we instantiate it
    _database = await initDataBase();
    return _database!;
  }

  initDataBase() async {
    // sqfliteFfiInit();
    Directory dir = await getApplicationDocumentsDirectory();
    var databaseFactory = databaseFactoryFfi;
    // var database = await databaseFactory.openDatabase(inMemoryDatabasePath);
    String path = join(dir.path, "app.db");
    var db = await databaseFactory.openDatabase(path,
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: (db, version) async {
            await db.execute('''
    CREATE TABLE User (
        id INTEGER PRIMARY KEY,
        name TEXT,
        phone TEXT,
         email TEXT,
        unit TEXT,
        level TEXT,
        dep TEXT,
        token TEXT
    )
    ''');
          },
        ));

    return db;
  }

  Future<User> storeOnLinuxOrWindows(User user) async {
    var db = await database;
    // print(db);
    user.user['token'] = user.token;
    user.user['id'] = 0;
    user.user.removeWhere((key, value) => key == "created_at");
    user.user.removeWhere((key, value) => key == "updated_at");
    await db.insert('User', user.user);
    await db.query('User');
    return user;
    // print(i);
  }

  Future<User> getForLinuxOrWindows() async {
    var db = await database;
    // print(db.getVersion());
    // print(db.path);
    var result = await db.query('User');
    // print(result);
    User user = User({}, '');
    result.isNotEmpty
        ? user = User(result[0], result[0]['token'].toString())
        : null;
    return user;
  }
}
