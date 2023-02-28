import 'package:oivan_app/src/features/sof/domain/repo/domain_repo.dart';
import '../../entities/sof_users_entity.dart';

class GetAllLocalUsers {
  final SOFDomainRepo _repo;

  const GetAllLocalUsers(this._repo);

  List<SofUserEntity> call() => _repo.getAllLocalUsers();
}
