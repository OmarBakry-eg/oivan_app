import 'package:oivan_app/src/features/sof/domain/repo/domain_repo.dart';
import '../../entities/sof_users_entity.dart';

class AddOneUser {
  final SOFDomainRepo _repo;

  const AddOneUser(this._repo);

  Future<int> call(SofUserEntity sofUserEntity) async=>await _repo.addOneUser(sofUserEntity);
}
