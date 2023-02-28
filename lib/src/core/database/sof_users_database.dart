import 'package:oivan_app/src/features/sof/domain/entities/sof_users_entity.dart';
import '../../../objectbox.g.dart';

class SOFLocalUsers {
  late final Store _store;
  late final Box<SofUserEntity> _usersbox;
  SOFLocalUsers._init(this._store) {
    _usersbox = Box<SofUserEntity>(_store);
  }

  static Future<SOFLocalUsers> init() async {
    final Store store = await openStore();
    return SOFLocalUsers._init(store);
  }

  SofUserEntity? getOneUser(int id) => _usersbox.get(id);

  List<SofUserEntity> getAllUsers() => _usersbox.getAll();

  int addOneUser(SofUserEntity sofUserEntity) => _usersbox.put(sofUserEntity);

  bool removeOneAsset(int id) => _usersbox.remove(id);
  int removeAllAssets() => _usersbox.removeAll();
}
