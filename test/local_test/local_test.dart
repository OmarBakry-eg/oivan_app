import 'package:flutter_test/flutter_test.dart';
import 'package:oivan_app/src/di.dart' as di;
import 'package:oivan_app/src/features/sof/data/source/local_source.dart';
import 'package:oivan_app/src/features/sof/domain/entities/sof_users_entity.dart';

void main() async {
  await di.init(unitTest: true);
  final SOFLocalSourceImpl sofLocalSourceImpl = SOFLocalSourceImpl(di.sl());

  group('LOCAL_STORAGE_TEST', () {
    test('getAllLocalUsers', () async {
      expect(sofLocalSourceImpl.getAllUsers(), <SofUsersEntity>[]);
    });

    test('addOneUser', () async {
      expect(await sofLocalSourceImpl.addOneUser(SofUserEntity()), 0);
    });

    test('removeOneUser', () async {
      expect(() async => await sofLocalSourceImpl.removeOneUser('id'),
          returnsNormally);
    });
  });
}
