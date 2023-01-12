import 'dart:io';

import 'package:aldayat_screens/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DpLite {}

Future initDataBase() async {
  // Init ffi loader if needed.
  try {
    sqfliteFfiInit();

    var databaseFactory = databaseFactoryFfi;
    Database db = await databaseFactory.openDatabase(inMemoryDatabasePath);
    //   var databasesPath = await getDatabasesPath();
    // String path = join(databasesPath, 'demo.db');
    // Database database = await openDatabase(path, version: 1,
    //     onCreate: (Database db, int version) async {
    //   // When creating the db, create the table
    //   await db.execute(
    //       'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
    // });
    await db.execute('''
  CREATE TABLE User (
      id INTEGER PRIMARY KEY,
      name TEXT,
      email TEXT,
      unit TEXT,
      level TEXT,
      dep TEXT,
      token TEXT
  )
  ''');
    // print(db.query(table));
  } catch (e) {
    print("SQlite initilising error" + e.toString());
  }
}

storeOnLinuxOrWindows(User user) async {
  try {
    var databaseFactory = databaseFactoryFfi;
    var db = await databaseFactory.openDatabase("");

    user.user['token'] = user.token;
    user.user['id'] = 0;
    await db.insert('User', user.user);

    await db.close();
  } catch (e) {
    print("Store sqlite Erro: $e");
  }
}

class User extends HiveObject {
  Map<String, dynamic> user;
  String token;

  User(this.user, this.token);
}

Future<List> findFromData(List<int> listId) async {
  try {
    //  await Hive.openBox<User>('info');
    var nameFrom = [];

    // var connectionBox =
    if (Hive.box<User>('info').isOpen) {
      // Hive.box<User>('info').close();
      //  print( Hive.box<User>('info').isOpen);
      print('--1--');
      for (var i in listId) {
        nameFrom.add(Hive.box<User>("info").get(i)?.user['name']);
      }
    } else {
      for (var i in listId) {
        nameFrom.add(Hive.box<User>("info").get(i)?.user['name']);
      }

      print('----');
    }

    return nameFrom;
  } catch (e) {
    print("------$e -----");
    Hive.box<User>('info').close();
    return ['error'];
  }
}

Future<User> storTheFuckers(List<dynamic> info) async {
  try {
    var box = await Hive.openBox<User>('info');
    for (var i in info) {
      var user = User(i, i['unit']);

      box.put(user.user['id'], user);
    }
    // box.close();
    return User({}, 'done');
  } catch (e) {
    print("HIVE Error:  => $e");
    return User({}, 'no');
  }
}

Future<User> stor(List<dynamic> info, bool remember) async {
  if (remember) {
    if (kIsWeb) {
      try {
        var box = await Hive.openBox<User>('info');

        var user = User(info[0], info[1]);

        box.put(0, user);

        box.close();
      } catch (e) {
        print("HIVE Error:  => $e");
      }
    }
    if (Platform.isLinux || Platform.isWindows) {
      storeOnLinuxOrWindows(User(info[0], info[1]));
    }
  }
  return User(info[0], info[1]);
}

Future remove(context) async {
  try {
    var box = await Hive.openBox<User>('info');

    box.delete(0);
    box.close();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
      (Route<dynamic> route) => false,
    );
  } catch (e) {
    print("HIVE Error:  => $e");
  }
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 0;

  @override
  User read(BinaryReader reader) {
    return User(reader.read(), reader.read());
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.write(obj.user);

    writer.write(obj.token);
  }
}

Future<User> getinfo(context) async {
  User user = User({}, '');
  if (kIsWeb) {
    User i = await getForWeb();
  }
  if (Platform.isLinux || Platform.isWindows) {
    User i = await getForLinuxOrWindows();
    return i;
  }
  return user;
}

Future<User> getForLinuxOrWindows() async {
  /// Add query for getting user Info

  try {
    var databaseFactory = databaseFactoryFfi;
    var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
    var result = await db.query('User');
    print(result);
    // prints [{id: 1, title: Product 1}, {id: 2, title: Product 1}]
    await db.close();
  } catch (e) {
    print(e);
  }
  return User({}, '');
}

Future<User> getForWeb() async {
  User user = User({}, '');
  var info = await Hive.openBox('info');
  try {
    if (info.values.isNotEmpty) {
      // print();
      if (info.toMap()[0] != null) {
        info.close();

        return info.toMap()[0];
      } else {
        info.close();

        return user;
      }
    }
    info.close();

    return user;
  } catch (e) {
    info.close();
    print('eeeeeeeeee');
    return user;
  }
}
