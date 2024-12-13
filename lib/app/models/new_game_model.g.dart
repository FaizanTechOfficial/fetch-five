// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewGameModel _$NewGameModelFromJson(Map<String, dynamic> json) => NewGameModel(
      gameId: json['game_id'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$NewGameModelToJson(NewGameModel instance) =>
    <String, dynamic>{
      'game_id': instance.gameId,
      'message': instance.message,
      'status': instance.status,
    };
