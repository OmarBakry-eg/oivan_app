import 'package:dartz/dartz.dart';
import 'package:oivan_app/src/core/errors/failures.dart';
import 'package:oivan_app/src/features/sof/domain/entities/sof_users_details_entity.dart';
import 'package:oivan_app/src/features/sof/domain/entities/sof_users_entity.dart';

abstract class SOFDomainRepo {
  Future<Either<Failure, SofUsersEntity>> getAllUsers(
      {String page = '1', String pageSize = '30'});
  Future<Either<Failure, SofUsersDetailsEntity>> getUserDetails(
      {String page = '1', String pageSize = '30', required String userID});
}
