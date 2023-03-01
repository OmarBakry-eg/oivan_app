import 'dart:convert';

ErrorModel errorModelFromJson(String str) => ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
    ErrorModel({
        this.errorId,
        this.errorMessage,
        this.errorName,
    });

    final int? errorId;
    final String? errorMessage;
    final String? errorName;

    factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        errorId: json["error_id"],
        errorMessage: json["error_message"],
        errorName: json["error_name"],
    );

    Map<String, dynamic> toJson() => {
        "error_id": errorId,
        "error_message": errorMessage,
        "error_name": errorName,
    };
}
