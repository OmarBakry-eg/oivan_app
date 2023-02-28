import 'package:dartz/dartz.dart';
import 'package:oivan_app/src/core/errors/failures.dart';
import 'package:oivan_app/src/features/sof/domain/entities/sof_users_details_entity.dart';
import 'package:oivan_app/src/features/sof/domain/repo/domain_repo.dart';

class GetUserDetails {
  final SOFDomainRepo _repo;

  const GetUserDetails(this._repo);

  Future<Either<Failure, SofUsersDetailsEntity>> call(
          {String page = '1',
          String pageSize = '30',
          required String userID}) async =>
      await _repo.getUserDetails(
          userID: userID, page: page, pageSize: pageSize);
}
