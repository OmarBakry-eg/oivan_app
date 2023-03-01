import 'package:dartz/dartz.dart';
import 'package:oivan_app/src/core/errors/failures.dart';
import 'package:oivan_app/src/features/sof/domain/repo/domain_repo.dart';

class RemoveOneUser {
  final SOFDomainRepo _repo;

  const RemoveOneUser(this._repo);

  Future<Either<Failure, bool>> call(dynamic id) async =>
      await _repo.removeOneUser(id);
}
