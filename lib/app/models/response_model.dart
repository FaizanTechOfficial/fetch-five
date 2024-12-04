import 'package:json_annotation/json_annotation.dart';
part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  @JsonKey(name: "authenticated")
  bool? authenticated;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "session_id")
  String? sessionId;
  @JsonKey(name: "status")
  String? status;

  ResponseModel({
    this.authenticated,
    this.message,
    this.sessionId,
    this.status,
  });

  ResponseModel copyWith({
    bool? authenticated,
    String? message,
    String? sessionId,
    String? status,
  }) =>
      ResponseModel(
        authenticated: authenticated ?? this.authenticated,
        message: message ?? this.message,
        sessionId: sessionId ?? this.sessionId,
        status: status ?? this.status,
      );

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
