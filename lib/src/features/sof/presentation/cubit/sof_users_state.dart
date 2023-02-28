part of 'sof_users_cubit.dart';

abstract class SofUsersState extends Equatable {
  const SofUsersState();

  @override
  List<Object> get props => [];
}

class SofUsersInitialState extends SofUsersState {}

//* REMOTE SofUsers
class SofUsersLoadingState extends SofUsersState {}

class SofUsersLoadedState extends SofUsersState {
  final List<SofUserEntity> sofUserEntityList;
  final bool hasReachedMax;
  const SofUsersLoadedState({required this.sofUserEntityList,required this.hasReachedMax});
  @override
  List<Object> get props => [sofUserEntityList];
}

class SofUsersErrorState extends SofUsersState {
  final String message;

  const SofUsersErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

//* REMOTE SofUsersDetails
class SofUsersDetailsLoadingState extends SofUsersState {}


class SofUsersDetailsLoadedState extends SofUsersState {
  final List<SofUserDetailsEntity> sofUsersDetailsEntityList;
  final bool hasReachedMax;
  const SofUsersDetailsLoadedState({required this.sofUsersDetailsEntityList,required this.hasReachedMax});
  @override
  List<Object> get props => [sofUsersDetailsEntityList];
}

class SofUsersDetailsErrorState extends SofUsersState {
  final String message;

  const SofUsersDetailsErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

//* LOCAL
class SofLocalUsersState extends SofUsersState {
  final List<SofUserEntity> sofUsersList;
  const SofLocalUsersState({required this.sofUsersList});
  @override
  List<Object> get props => [sofUsersList];
}
