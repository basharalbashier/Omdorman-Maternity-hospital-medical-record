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

    var databaseFactory = databaseFactoryFfi;
    var database = await databaseFactory.openDatabase(inMemoryDatabasePath);
    await database.execute('''
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
    return database;
  }

  storeOnLinuxOrWindows(User user) async {
    var db = await database;

    user.user['token'] = user.token;
    user.user['id'] = 0;
    user.user.removeWhere((key, value) => key == "created_at");
    user.user.removeWhere((key, value) => key == "updated_at");
    await db.insert('User', user.user);
    var i = await db.query('User');
    print(i);
  }

  getForLinuxOrWindows() async {
    var db = await database;

    var result = await db.query('User');
    print(result);
    User user = User({}, '');
    result.isNotEmpty ? User(result[0], result[0]['token'].toString()) : null;
    return user;
  }
}
