import 'package:equatable/equatable.dart';

class SofUsersEntity extends Equatable {
  const SofUsersEntity({
    this.items,
  });

  final List<SofUserEntity>? items;

  @override
  List<Object?> get props => [items];
}

class SofUserEntity extends Equatable {
  const SofUserEntity({
    this.reputation,
    this.userId,
    this.location,
    this.profileImage,
    this.displayName,
  });

  final int? reputation;
  final int? userId;
  final String? location;
  final String? profileImage;
  final String? displayName;

  @override
  List<Object?> get props => [
        reputation,
        userId,
        location,
        profileImage,
        displayName,
      ];
}
