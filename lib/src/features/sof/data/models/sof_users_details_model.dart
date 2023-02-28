import 'package:oivan_app/src/features/sof/domain/entities/sof_users_details_entity.dart';

class SofUsersDetailsModel extends SofUsersDetailsEntity {
  const SofUsersDetailsModel({
    super.items,
    super.hasMore
  });

  factory SofUsersDetailsModel.fromJson(Map<String, dynamic> json) =>
      SofUsersDetailsModel(
        items: json["items"] == null
            ? []
            : List<SofUserDetailsModel>.from(
                json["items"]!.map((x) => SofUserDetailsModel.fromJson(x))),
                hasMore: json["has_more"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) {
                x as SofUserDetailsModel;
                return x.toJson();
              })),
      };
}

class SofUserDetailsModel extends SofUserDetailsEntity {
  const SofUserDetailsModel({
    super.reputationHistoryType,
    super.reputationChange,
    super.postId,
    super.creationDate,
    super.userId,
  });

  factory SofUserDetailsModel.fromJson(Map<String, dynamic> json) =>
      SofUserDetailsModel(
        reputationHistoryType: json["reputation_history_type"],
        reputationChange: json["reputation_change"],
        postId: json["post_id"],
        creationDate: json["creation_date"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "reputation_history_type": reputationHistoryType,
        "reputation_change": reputationChange,
        "post_id": postId,
        "creation_date": creationDate,
        "user_id": userId,
      };
}
