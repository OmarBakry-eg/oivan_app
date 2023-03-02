import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';

import '../../features/sof/domain/entities/sof_users_entity.dart';

class SOFLocalUsersDatabase {
  late Box<SofUserEntity> _usersbox;

  SOFLocalUsersDatabase(this._usersbox);

  SOFLocalUsersDatabase._init(this._usersbox) {
    _usersbox = _usersbox;
  }
  static Future<SOFLocalUsersDatabase> init({bool unitTest = false}) async {
    await Hive.initFlutter();
    Hive.registerAdapter<SofUserEntity>(SofUserEntityAdapter());
    final Box<SofUserEntity> store = await Hive.openBox('users');
    return SOFLocalUsersDatabase._init(store);
  }

  static Future<SOFLocalUsersDatabase> initForUnitTest() async {
    var path = Directory.current.path;
    Hive
      ..init(path)
      ..registerAdapter(SofUserEntityAdapter());

    Hive.deleteBoxFromDisk('users');

    final Box<SofUserEntity> store = await Hive.openBox('users');
    return SOFLocalUsersDatabase._init(store);
  }

  Future<void> closeAllBoxes() async => await _usersbox.close();

  List<SofUserEntity> getAllUsers() => _usersbox.values.toList();

  Future<int> addOneUser(SofUserEntity sofUserEntity) async =>
      await _usersbox.add(sofUserEntity);

  Future<void> removeOneUser(dynamic id) async => await _usersbox.delete(id);
}
