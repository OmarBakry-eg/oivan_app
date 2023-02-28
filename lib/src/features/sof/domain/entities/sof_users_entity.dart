import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

class SofUsersEntity extends Equatable {
  const SofUsersEntity({
    this.items,
  });

  final List<SofUserEntity>? items;

  @override
  List<Object?> get props => [items];
}

@Entity()
// ignore: must_be_immutable
class SofUserEntity extends Equatable {
  SofUserEntity({
    this.reputation,
    this.userId,
    this.location,
    this.profileImage,
    this.displayName,
    this.id = 0
  });
  @Id()
  int id;
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
