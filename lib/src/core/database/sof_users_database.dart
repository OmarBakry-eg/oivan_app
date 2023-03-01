// import 'package:oivan_app/src/features/sof/domain/entities/sof_users_entity.dart';
// import '../../../objectbox.g.dart';

// class SOFLocalUsersDatabase {
//   late final Store _store;
//  static late final Box<SofUserEntity> _usersbox;
//   SOFLocalUsersDatabase._init(this._store) {
//     _usersbox = Box<SofUserEntity>(_store);
//   }

//   static Future<SOFLocalUsersDatabase> init() async {
//     final Store store = await openStore();
//     return SOFLocalUsersDatabase._init(store);
//   }

//   //SofUserEntity? getOneUser(int id) => _usersbox.get(id);

// List<SofUserEntity> getAllUsers() => _usersbox.getAll();

// int addOneUser(SofUserEntity sofUserEntity) => _usersbox.put(sofUserEntity);

// bool removeOneUser(int id) => _usersbox.remove(id);

//   static int removeAllUsers() => _usersbox.removeAll();
// }

import 'package:hive_flutter/hive_flutter.dart';

import '../../features/sof/domain/entities/sof_users_entity.dart';

class SOFLocalUsersDatabase {
  late Box<SofUserEntity> _usersbox;
  SOFLocalUsersDatabase._init(this._usersbox) {
    _usersbox = _usersbox;
  }
  static Future<SOFLocalUsersDatabase> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<SofUserEntity>(SofUserEntityAdapter());
    final Box<SofUserEntity> store = await Hive.openBox('users');
    return SOFLocalUsersDatabase._init(store);
  }

  Future<void> closeAllBoxes() async => await _usersbox.close();

  List<SofUserEntity> getAllUsers() => _usersbox.values.toList();

  Future<int> addOneUser(SofUserEntity sofUserEntity) async =>
      await _usersbox.add(sofUserEntity);

  Future<void> removeOneUser(dynamic id) async => await _usersbox.delete(id);
}
