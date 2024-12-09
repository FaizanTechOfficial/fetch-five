// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerInfoModel _$PlayerInfoModelFromJson(Map<String, dynamic> json) =>
    PlayerInfoModel(
      playerName: json['player_name'] as String?,
      playerProfilePic: json['player_profile_pic'] as String?,
    );

Map<String, dynamic> _$PlayerInfoModelToJson(PlayerInfoModel instance) =>
    <String, dynamic>{
      'player_name': instance.playerName,
      'player_profile_pic': instance.playerProfilePic,
    };
