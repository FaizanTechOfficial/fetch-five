// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GamesModel _$GamesModelFromJson(Map<String, dynamic> json) => GamesModel(
      activeGamesTheirTurn: json['active_games_their_turn'] == null
          ? null
          : ActiveGamesTurn.fromJson(
              json['active_games_their_turn'] as Map<String, dynamic>),
      activeGamesYourTurn: json['active_games_your_turn'] == null
          ? null
          : ActiveGamesTurn.fromJson(
              json['active_games_your_turn'] as Map<String, dynamic>),
      completedGames: json['completed_games'] == null
          ? null
          : ActiveGamesTurn.fromJson(
              json['completed_games'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GamesModelToJson(GamesModel instance) =>
    <String, dynamic>{
      'active_games_their_turn': instance.activeGamesTheirTurn,
      'active_games_your_turn': instance.activeGamesYourTurn,
      'completed_games': instance.completedGames,
    };

ActiveGamesTurn _$ActiveGamesTurnFromJson(Map<String, dynamic> json) =>
    ActiveGamesTurn(
      games: (json['games'] as List<dynamic>?)
          ?.map((e) => GameModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      label: json['label'] as String?,
    );

Map<String, dynamic> _$ActiveGamesTurnToJson(ActiveGamesTurn instance) =>
    <String, dynamic>{
      'games': instance.games,
      'label': instance.label,
    };
