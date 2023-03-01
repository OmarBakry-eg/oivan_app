import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:oivan_app/src/di.dart' as di;
import 'package:bloc_test/bloc_test.dart';
import 'package:oivan_app/src/features/sof/domain/entities/sof_users_entity.dart';
import 'package:oivan_app/src/features/sof/presentation/cubit/sof_users_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(unitTest: true);

  late SofUsersCubit sofUsersCubit;
  setUp(() {
    sofUsersCubit = SofUsersCubit(di.sl(), di.sl(), di.sl(), di.sl(), di.sl());
  });

  group('SofUsersCubit', () {
    test('init state is SofUsersInitialState', () {
      expect(sofUsersCubit.state, SofUsersInitialState());
    });
    blocTest(
      'dateConverterForDetails',
      build: () => sofUsersCubit,
      act: (cubit) => sofUsersCubit.dateConverterForDetails(122),
      expect: () => [],
    );

    blocTest(
      'getAllLocalUsers',
      build: () => sofUsersCubit,
      act: (cubit) => sofUsersCubit.getAllLocalUsers(),
      expect: () =>
          [SofLocalNewState(), const SofLocalUsersState(sofUsersList: [])],
    );

    blocTest(
      'getAllUsers',
      build: () => sofUsersCubit,
      act: (cubit) => sofUsersCubit.getAllUsers(),
      expect: () => [SofUsersLoadingState(), isA<SofUsersLoadedState>()],
    );

    blocTest(
      'getUserDetails',
      build: () => sofUsersCubit,
      act: (cubit) => sofUsersCubit.getUserDetails(userID: '22656'),
      expect: () =>
          [SofUsersDetailsLoadingState(), isA<SofUsersDetailsLoadedState>()],
    );

    blocTest(
      'isItemFound',
      build: () => sofUsersCubit,
      act: (cubit) => sofUsersCubit.isItemFound(SofUserEntity()),
      expect: () => [],
    );

    blocTest(
      'addOrDeleteUserFunc',
      build: () => sofUsersCubit,
      act: (cubit) => sofUsersCubit.addOrDeleteUserFunc(SofUserEntity()),
      expect: () => [SofLocalNewState(), isA<SofLocalUsersState>()],
    );

    blocTest(
      'clearDataFromUserDetails',
      build: () => sofUsersCubit,
      act: (cubit) => sofUsersCubit.clearDataFromUserDetails(),
      expect: () => [],
    );

    blocTest(
      'setupScrollController',
      build: () => sofUsersCubit,
      act: (cubit) => sofUsersCubit.setupScrollController(),
      expect: () => [],
    );

    blocTest(
      'setupScrollDetailsController',
      build: () => sofUsersCubit,
      act: (cubit) => sofUsersCubit.setupScrollDetailsController('22656'),
      expect: () => [],
    );
  });
}
