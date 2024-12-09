// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardGameModel _$DashboardGameModelFromJson(Map<String, dynamic> json) =>
    DashboardGameModel(
      games: json['games'] == null
          ? null
          : GamesModel.fromJson(json['games'] as Map<String, dynamic>),
      playerInfo: json['player_info'] == null
          ? null
          : PlayerInfoModel.fromJson(
              json['player_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardGameModelToJson(DashboardGameModel instance) =>
    <String, dynamic>{
      'games': instance.games,
      'player_info': instance.playerInfo,
    };
