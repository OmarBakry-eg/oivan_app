import 'package:dartz/dartz.dart';
import 'package:oivan_app/src/core/errors/failures.dart';
import 'package:oivan_app/src/features/sof/domain/repo/domain_repo.dart';

class RemoveOneUser {
  final SOFDomainRepo _repo;

  const RemoveOneUser(this._repo);

  Either<Failure, bool> call(int id) => _repo.removeOneUser(id);
}
