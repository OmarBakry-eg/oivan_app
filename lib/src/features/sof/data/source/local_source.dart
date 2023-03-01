import 'package:oivan_app/src/core/database/sof_users_database.dart';
import 'package:oivan_app/src/core/errors/exceptions.dart';
import 'package:oivan_app/src/features/sof/domain/entities/sof_users_entity.dart';

abstract class SOFLocalSource {
  List<SofUserEntity> getAllUsers();
  Future<int> addOneUser(SofUserEntity sofUserEntity);
  Future<void> removeOneUser(int id);
}

class SOFLocalSourceImpl implements SOFLocalSource {
  final SOFLocalUsersDatabase _sofLocalUsersDatabase;

  SOFLocalSourceImpl(this._sofLocalUsersDatabase);

  @override
  Future<int> addOneUser(SofUserEntity sofUserEntity) async =>
      await _sofLocalUsersDatabase.addOneUser(sofUserEntity);

  @override
  List<SofUserEntity> getAllUsers() => _sofLocalUsersDatabase.getAllUsers();

  @override
  Future<void> removeOneUser(dynamic id) async {
    _sofLocalUsersDatabase.removeOneUser(id).onError((error, stackTrace) =>
        throw LocalStorageException(message: error.toString()));
  }
}
