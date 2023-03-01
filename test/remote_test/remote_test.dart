import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:oivan_app/src/core/errors/exceptions.dart';
import 'package:oivan_app/src/features/sof/data/models/sof_users_model.dart';
import 'package:oivan_app/src/features/sof/data/source/remote_source.dart';
import 'package:oivan_app/src/di.dart' as di;

class MockRemoteSource extends Mock implements SOFRemoteSourceImpl {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(unitTest: true);
  final MockRemoteSource mockRemoteSource = MockRemoteSource();
  final SOFRemoteSourceImpl remoteSourceDataImpl =
      SOFRemoteSourceImpl(dioClient: di.sl());

  group('API_REMOTE_TEST', () {
    test('getAllUsers', () async {
      when(() => mockRemoteSource.getAllUsers())
          .thenAnswer((invocation) => Future.value(const SofUsersModel()));

      expect(remoteSourceDataImpl.getAllUsers(), isA<Future<SofUsersModel>>());
    });

    test('getUserDetails', () async {
      when(() => mockRemoteSource.getUserDetails(userID: ''))
          .thenAnswer((invocation) => throw ServerException());

      expect(() async => await remoteSourceDataImpl.getUserDetails(userID: ''),
          throwsA(isA<ServerException>()));
    });
  });
}
