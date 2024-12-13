// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameDetailModel _$GameDetailModelFromJson(Map<String, dynamic> json) =>
    GameDetailModel(
      gameStatus: json['game_status'] as String? ?? 'unknown',
      lastMoveTime: (json['last_move_time'] as num?)?.toDouble() ?? 0.0,
      opponentsLastSquare:
          (json['opponents_last_square'] as num?)?.toInt() ?? 0,
      playerHand: (json['player_hand'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      playerOneCardCount: (json['player_one_card_count'] as num?)?.toInt() ?? 0,
      playerOneLastCard: json['player_one_last_card'],
      playerOneName: json['player_one_name'] as String? ?? '',
      playerOneProfilePic: json['player_one_profile_pic'] as String? ?? '',
      playerOneSquares: (json['player_one_squares'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      playerTwoCardCount: (json['player_two_card_count'] as num?)?.toInt() ?? 0,
      playerTwoLastCard: json['player_two_last_card'],
      playerTwoName: json['player_two_name'] as String? ?? '',
      playerTwoProfilePic: json['player_two_profile_pic'] as String? ?? '',
      playerTwoSquares: (json['player_two_squares'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      thisPlayer: json['this_player'] as String? ?? '',
      thisPlayersTurn: json['this_players_turn'] as bool? ?? false,
    );

Map<String, dynamic> _$GameDetailModelToJson(GameDetailModel instance) =>
    <String, dynamic>{
      'game_status': instance.gameStatus,
      'last_move_time': instance.lastMoveTime,
      'opponents_last_square': instance.opponentsLastSquare,
      'player_hand': instance.playerHand,
      'player_one_card_count': instance.playerOneCardCount,
      'player_one_last_card': instance.playerOneLastCard,
      'player_one_name': instance.playerOneName,
      'player_one_profile_pic': instance.playerOneProfilePic,
      'player_one_squares': instance.playerOneSquares,
      'player_two_card_count': instance.playerTwoCardCount,
      'player_two_last_card': instance.playerTwoLastCard,
      'player_two_name': instance.playerTwoName,
      'player_two_profile_pic': instance.playerTwoProfilePic,
      'player_two_squares': instance.playerTwoSquares,
      'this_player': instance.thisPlayer,
      'this_players_turn': instance.thisPlayersTurn,
    };
