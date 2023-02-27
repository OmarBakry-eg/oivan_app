import 'dart:convert';

UnAuthorizedModel unAuthorizedModelFromJson(String str) =>
    UnAuthorizedModel.fromJson(json.decode(str));

String unAuthorizedModelToJson(UnAuthorizedModel data) =>
    json.encode(data.toJson());

class UnAuthorizedModel {
  UnAuthorizedModel({
    this.type,
    this.title,
    this.status,
    this.traceId,
  });

  String? type;
  String? title;
  int? status;
  String? traceId;

  factory UnAuthorizedModel.fromJson(Map<String, dynamic> json) =>
      UnAuthorizedModel(
        type: json["type"],
        title: json["title"],
        status: json["status"],
        traceId: json["traceId"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "title": title,
        "status": status,
        "traceId": traceId,
      };
}
