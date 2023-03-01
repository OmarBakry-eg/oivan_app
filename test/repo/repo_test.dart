import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oivan_app/src/core/errors/failures.dart';
import 'package:oivan_app/src/features/sof/data/repo/data_repo.dart';
import 'package:oivan_app/src/di.dart' as di;
import 'package:oivan_app/src/features/sof/domain/entities/sof_users_details_entity.dart';
import 'package:oivan_app/src/features/sof/domain/entities/sof_users_entity.dart';

class MockRepoSource extends Mock implements SOFDataRepoImpl {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init(unitTest: true);
  final MockRepoSource mockRepoSource = MockRepoSource();
  final SOFDataRepoImpl sofDataRepoImpl = SOFDataRepoImpl(
      sofLocalSourceImpl: di.sl(), sofRemoteSourceImpl: di.sl());

  group('DATA_REPO_TEST', () {
    test('repo_getAllUsers', () async {
      when(() => mockRepoSource.getAllUsers()).thenAnswer((invocation) =>
          Future.value(Either.cond(() => false, () => const SofUsersEntity(),
              () => const ServerFailure(message: ''))));

      expect(await sofDataRepoImpl.getAllUsers(),
          isA<Either<Failure, SofUsersEntity>>());
    });

    test('repo_getUserDetails', () async {
      when(() => mockRepoSource.getUserDetails(userID: '1')).thenAnswer(
          (invocation) => Future.value(Either.cond(
              () => false,
              () => const SofUsersDetailsEntity(),
              () => const ServerFailure(message: ''))));

      expect(await sofDataRepoImpl.getUserDetails(userID: '1'),
          isA<Either<Failure, SofUsersDetailsEntity>>());
    });

    test('repo_getAllLocalUsers', () async {
      expect(sofDataRepoImpl.getAllLocalUsers(), <SofUsersEntity>[]);
    });

    test('repo_addOneUser', () async {
      expect(await sofDataRepoImpl.addOneUser(SofUserEntity()), 0);
    });

    test('repo_removeOneUser', () async {
      expect(await sofDataRepoImpl.removeOneUser('id'), const Right(true));
    });
  });
}
