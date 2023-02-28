import 'package:oivan_app/src/features/sof/domain/entities/sof_users_entity.dart';

class SofUsersModel extends SofUsersEntity {
  const SofUsersModel({
    super.items,
    super.hasMore
  });

  factory SofUsersModel.fromJson(Map<String, dynamic> json) => SofUsersModel(
        items: json["items"] == null
            ? []
            : List<SofUserModel>.from(
                json["items"]!.map((x) => SofUserModel.fromJson(x))),
                hasMore: json["has_more"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) {
                x as SofUserModel;
                return x.toJson();
              })),
      };
}

// ignore: must_be_immutable
class SofUserModel extends SofUserEntity {
  SofUserModel({
    super.reputation,
    super.userId,
    super.location,
    super.profileImage,
    super.displayName,
  });

  factory SofUserModel.fromJson(Map<String, dynamic> json) => SofUserModel(
        reputation: json["reputation"],
        userId: json["user_id"],
        location: json["location"],
        profileImage: json["profile_image"],
        displayName: json["display_name"],
      );

  Map<String, dynamic> toJson() => {
        "reputation": reputation,
        "user_id": userId,
        "location": location,
        "profile_image": profileImage,
        "display_name": displayName,
      };
}
