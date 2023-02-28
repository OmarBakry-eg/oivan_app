import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oivan_app/src/core/errors/logger.dart';
import 'package:oivan_app/src/features/sof/domain/entities/sof_users_entity.dart';
import 'package:oivan_app/src/features/sof/domain/usecase/remote_usecases/get_all_users.dart';
import 'package:oivan_app/src/features/sof/domain/usecase/remote_usecases/get_user_details.dart';

import '../../../../core/errors/failures.dart';
import '../../../../utils/ui/consts.dart';
import '../../domain/entities/sof_users_details_entity.dart';
import '../../domain/usecase/local_usecase/add_one_user.dart';
import '../../domain/usecase/local_usecase/get_all_local_users.dart';
import '../../domain/usecase/local_usecase/remove_one_user.dart';

part 'sof_users_state.dart';

class SofUsersCubit extends Cubit<SofUsersState> {
  //* LOCAL
  final AddOneUser _addOneUser;
  final GetAllLocalUsers _getAllLocalUsers;
  final RemoveOneUser _removeOneUser;
  //* REMOTE
  final GetAllUsers _getAllUsers;
  final GetUserDetails _getUserDetails;
  SofUsersCubit(this._addOneUser, this._getAllLocalUsers, this._removeOneUser,
      this._getAllUsers, this._getUserDetails)
      : super(SofUsersInitialState());

//* Remote IMPL
  int _sofUserspage = 1, _sofUsersDetailspage = 1;

  SofUsersEntity _sofUsersEntity = const SofUsersEntity();
  SofUsersDetailsEntity _sofUsersDetailsEntity = const SofUsersDetailsEntity();

  List<SofUserEntity> _sofUserEntityList = [];
  List<SofUserDetailsEntity> _sofUserDetailsEntityList = [];

  final ScrollController scrollController = ScrollController();
  final ScrollController scrollControllerDetails = ScrollController();

  Future getAllUsers() async {
    logInfo('getAllUsers called');
    final SofUsersState? newState = _checkIfModelHasMoreData(false);
    if (newState != null) {
      emit(newState);
    }
    final Either<Failure, SofUsersEntity> res = await _getAllUsers(
      page: _sofUserspage.toString(),
    );
    emit(_emitSofUsersLoadedStateOrSofUsersErrorState(res));
  }

  Future getUserDetails({required String userID}) async {
    logInfo('getUserDetails called');
    if (_sofUsersDetailspage >= 25) {
      return;
    }
    final SofUsersState? newState = _checkIfModelHasMoreData(true);
    if (newState != null) {
      emit(newState);
    }
    final Either<Failure, SofUsersDetailsEntity> res = await _getUserDetails(
      userID: userID,
      page: _sofUsersDetailspage.toString(),
    );
    emit(_emitSofUsersDetailsLoadedStateOrSofUsersDetailsErrorState(res));
  }

  void setupScrollController(bool useSOFDetails, {String? userID}) {
    if (useSOFDetails) {
      scrollControllerDetails.addListener(() {
        if (scrollControllerDetails.position.atEdge) {
          if (scrollControllerDetails.position.pixels != 0) {
            if (_sofUsersDetailspage >= 25) {
              return;
            }
            getUserDetails(userID: userID!);
          }
        }
      });
    } else {
      scrollController.addListener(() {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels != 0) {
            if (_sofUserspage >= 25) {
              return;
            }
            getAllUsers();
          }
        }
      });
    }
  }

//! Private Functions
  SofUsersState? _checkIfModelHasMoreData(bool useSOFDetails) {
    if (useSOFDetails) {
      return _checkMoreItemsInSofUserDetails();
    }
    return _checkMoreItemsInSofUser();
  }

  SofUsersState? _checkMoreItemsInSofUserDetails() {
    if (_sofUsersDetailsEntity.hasMore != null &&
        _sofUsersDetailsEntity.hasMore!) {
      _sofUsersDetailspage = _sofUsersDetailspage + 1;
      Timer(const Duration(milliseconds: 30), () {
        scrollControllerDetails
            .jumpTo(scrollControllerDetails.position.maxScrollExtent);
      });
      return null;
      // return SofUsersDetailsPaginationLoadingState(
      //     sofUsersDetailsEntityList: _sofUserDetailsEntityList);
    } else {
      return SofUsersDetailsLoadingState();
    }
  }

  SofUsersState? _checkMoreItemsInSofUser() {
    if (_sofUsersEntity.hasMore != null && _sofUsersEntity.hasMore!) {
      _sofUserspage = _sofUserspage + 1;
      Timer(const Duration(milliseconds: 30), () {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      });
      return null;
      // return SofUsersPaginationLoadingState(
      //     sofUserEntityList: _sofUserEntityList);
    } else {
      return SofUsersLoadingState();
    }
  }

  SofUsersState _emitSofUsersLoadedStateOrSofUsersErrorState(
      Either<Failure, SofUsersEntity> res) {
    return res.fold((failure) {
      Constants.showMessage(description: failure.message);
      return SofUsersErrorState(message: failure.message);
    }, (sofUserEntity) {
      _sofUsersEntity = sofUserEntity;
      _sofUserEntityList = [..._sofUserEntityList, ...?_sofUsersEntity.items];
      return SofUsersLoadedState(
          sofUserEntityList: _sofUserEntityList,
          hasReachedMax: _sofUserspage >= 25);
    });
  }

  SofUsersState _emitSofUsersDetailsLoadedStateOrSofUsersDetailsErrorState(
      Either<Failure, SofUsersDetailsEntity> res) {
    return res.fold((failure) {
      Constants.showMessage(description: failure.message);
      return SofUsersDetailsErrorState(message: failure.message);
    }, (sofUsersDetailsEntity) {
      _sofUsersDetailsEntity = sofUsersDetailsEntity;
      _sofUserDetailsEntityList = [
        ..._sofUserDetailsEntityList,
        ...?_sofUsersDetailsEntity.items
      ];
      return SofUsersDetailsLoadedState(
          sofUsersDetailsEntityList: _sofUserDetailsEntityList,
          hasReachedMax: _sofUsersDetailspage >= 25);
    });
  }

//! Core
  @override
  Future<void> close() {
    scrollController.dispose();
    scrollControllerDetails.dispose();
    return super.close();
  }
}
