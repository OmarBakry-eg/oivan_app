import 'package:equatable/equatable.dart';

class SofUsersDetailsEntity extends Equatable {
  const SofUsersDetailsEntity({
    this.items,
    this.hasMore
  });

  final List<SofUserDetailsEntity>? items;
  final bool? hasMore;

  @override
  List<Object?> get props => [items];
}

class SofUserDetailsEntity extends Equatable {
  const SofUserDetailsEntity({
    this.reputationHistoryType,
    this.reputationChange,
    this.postId,
    this.creationDate,
    this.userId,
  });

  final String? reputationHistoryType;
  final int? reputationChange;
  final int? postId;
  final int? creationDate;
  final int? userId;

  @override
  List<Object?> get props =>
      [reputationHistoryType, reputationChange, postId, creationDate, userId];
}
