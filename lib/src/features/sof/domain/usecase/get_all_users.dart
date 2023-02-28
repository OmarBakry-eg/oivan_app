import 'package:dartz/dartz.dart';
import 'package:oivan_app/src/core/errors/failures.dart';
import 'package:oivan_app/src/features/sof/domain/repo/domain_repo.dart';
import '../entities/sof_users_entity.dart';

class GetAllUsers {
  final SOFDomainRepo _repo;

  const GetAllUsers(this._repo);

  Future<Either<Failure, SofUsersEntity>> call(
          {String page = '1', String pageSize = '30'}) async =>
      await _repo.getAllUsers(page: page, pageSize: pageSize);
}
