// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) =>
    ResponseModel(
      authenticated: json['authenticated'] as bool?,
      message: json['message'] as String?,
      sessionId: json['session_id'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) =>
    <String, dynamic>{
      'authenticated': instance.authenticated,
      'message': instance.message,
      'session_id': instance.sessionId,
      'status': instance.status,
    };
