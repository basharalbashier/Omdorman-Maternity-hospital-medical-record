import 'dart:io';
import 'package:aldayat_screens/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'db.dart';

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
      await DbLite.db.storeOnLinuxOrWindows(User(info[0], info[1]));
    }
  }
  return User(info[0], info[1]);
}

Future remove(context) async {
  if (kIsWeb) {
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
  if (Platform.isLinux || Platform.isWindows) {
    await DbLite.db.deletUserData();
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
    User i = await DbLite.db.getForLinuxOrWindows();
    return i;
  }
  return user;
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
