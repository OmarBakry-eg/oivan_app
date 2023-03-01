import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'sof_users_entity.g.dart';

class SofUsersEntity extends Equatable {
  const SofUsersEntity({this.items, this.hasMore});

  final List<SofUserEntity>? items;
  final bool? hasMore;

  @override
  List<Object?> get props => [items, hasMore];
}

@HiveType(typeId: 1)
class SofUserEntity extends HiveObject {
   SofUserEntity({
    this.reputation,
    this.userId,
    this.location,
    this.profileImage,
    this.displayName,
  });
  @HiveField(1)
  final int? reputation;
  @HiveField(0)
  final int? userId;
  @HiveField(2)
  final String? location;
  @HiveField(3)
  final String? profileImage;
  @HiveField(4)
  final String? displayName;

  // @override
  // List<Object?> get props =>
  //     [reputation, userId, location, profileImage, displayName];
}
