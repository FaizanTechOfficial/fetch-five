// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
      gameId: json['game_id'] as String?,
      gameStatus: json['game_status'] as String?,
      lastMoveTime: (json['last_move_time'] as num?)?.toDouble(),
      opponentProfilePic: json['opponent_profile_pic'] as String?,
      opponentName: json['opponent_name'] as String?,
      squaresPlayed: (json['squares_played'] as num?)?.toInt(),
      thisPlayersTurn: json['this_players_turn'] as bool?,
    );

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'game_id': instance.gameId,
      'game_status': instance.gameStatus,
      'last_move_time': instance.lastMoveTime,
      'opponent_name': instance.opponentName,
      'opponent_profile_pic': instance.opponentProfilePic,
      'squares_played': instance.squaresPlayed,
      'this_players_turn': instance.thisPlayersTurn,
    };
