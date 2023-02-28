import 'package:oivan_app/src/features/sof/data/source/local_source.dart';
import 'package:oivan_app/src/features/sof/data/source/remote_source.dart';
import 'package:oivan_app/src/features/sof/domain/entities/sof_users_entity.dart';
import 'package:oivan_app/src/features/sof/domain/entities/sof_users_details_entity.dart';
import 'package:oivan_app/src/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:oivan_app/src/features/sof/domain/repo/domain_repo.dart';

import '../../../../core/errors/exceptions.dart';

class SOFDataRepoImpl implements SOFDomainRepo {
  final SOFRemoteSourceImpl _sofRemoteSourceImpl;
  final SOFLocalSourceImpl _sofLocalSourceImpl;

  const SOFDataRepoImpl({
    required SOFRemoteSourceImpl sofRemoteSourceImpl,
    required SOFLocalSourceImpl sofLocalSourceImpl,
  })  : _sofRemoteSourceImpl = sofRemoteSourceImpl,
        _sofLocalSourceImpl = sofLocalSourceImpl;
  @override
  Future<Either<Failure, SofUsersEntity>> getAllUsers(
      {String page = '1', String pageSize = '30'}) async {
    try {
      final SofUsersEntity sofUsersEntity = await _sofRemoteSourceImpl
          .getAllUsers(page: page, pageSize: pageSize);
      return Right(sofUsersEntity);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on OfflineException catch (e) {
      return Left(OfflineFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, SofUsersDetailsEntity>> getUserDetails(
      {String page = '1',
      String pageSize = '30',
      required String userID}) async {
    try {
      final SofUsersDetailsEntity sofUsersDetailsEntity =
          await _sofRemoteSourceImpl.getUserDetails(
              page: page, pageSize: pageSize, userID: userID);
      return Right(sofUsersDetailsEntity);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on OfflineException catch (e) {
      return Left(OfflineFailure(message: e.message));
    }
  }

  @override
  int addOneUser(SofUserEntity sofUserEntity) =>
      _sofLocalSourceImpl.addOneUser(sofUserEntity);

  @override
  List<SofUserEntity> getAllLocalUsers() => _sofLocalSourceImpl.getAllUsers();

  @override
  Either<Failure, bool> removeOneUser(int id) {
    try {
      return Right(_sofLocalSourceImpl.removeOneUser(id));
    } on LocalStorageException catch (e) {
      return Left(LocalStorageFailure(message: e.message));
    }
  }
}
