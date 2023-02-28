import 'package:oivan_app/src/core/database/sof_users_database.dart';
import 'package:oivan_app/src/core/errors/exceptions.dart';
import 'package:oivan_app/src/features/sof/domain/entities/sof_users_entity.dart';

abstract class SOFLocalSource {
  //SofUserEntity? getOneUser(int id);
  List<SofUserEntity> getAllUsers();
  int addOneUser(SofUserEntity sofUserEntity);
  bool removeOneUser(int id);
  // int removeAllUsers();
}

class SOFLocalSourceImpl implements SOFLocalSource {
  final SOFLocalUsersDatabase _sofLocalUsersDatabase;

  SOFLocalSourceImpl(this._sofLocalUsersDatabase);

  @override
  int addOneUser(SofUserEntity sofUserEntity) =>
      _sofLocalUsersDatabase.addOneUser(sofUserEntity);

  @override
  List<SofUserEntity> getAllUsers() => _sofLocalUsersDatabase.getAllUsers();

  @override
  bool removeOneUser(int id) {
    final bool delete = _sofLocalUsersDatabase.removeOneUser(id);
    if (delete) return delete;
    throw LocalStorageException(message: 'Cannot delete this user');
  }

  // @override
  // SofUserEntity? getOneUser(int id) => _sofLocalUsersDatabase.getOneUser(id);

  // @override
  // int removeAllUsers() => _sofLocalUsersDatabase.removeAllUsers();
}
