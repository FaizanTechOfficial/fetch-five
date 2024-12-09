import 'package:fetch_five/app/models/game_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'games_model.g.dart';

@JsonSerializable()
class GamesModel {
  @JsonKey(name: "active_games_their_turn")
  final ActiveGamesTurn? activeGamesTheirTurn;
  @JsonKey(name: "active_games_your_turn")
  final ActiveGamesTurn? activeGamesYourTurn;
  @JsonKey(name: "completed_games")
  final ActiveGamesTurn? completedGames;

  GamesModel({
    this.activeGamesTheirTurn,
    this.activeGamesYourTurn,
    this.completedGames,
  });

  GamesModel copyWith({
    ActiveGamesTurn? activeGamesTheirTurn,
    ActiveGamesTurn? activeGamesYourTurn,
    ActiveGamesTurn? completedGames,
  }) =>
      GamesModel(
        activeGamesTheirTurn: activeGamesTheirTurn ?? this.activeGamesTheirTurn,
        activeGamesYourTurn: activeGamesYourTurn ?? this.activeGamesYourTurn,
        completedGames: completedGames ?? this.completedGames,
      );

  factory GamesModel.fromJson(Map<String, dynamic> json) =>
      _$GamesModelFromJson(json);

  Map<String, dynamic> toJson() => _$GamesModelToJson(this);
}

@JsonSerializable()
class ActiveGamesTurn {
  @JsonKey(name: "games")
  final List<GameModel>? games;
  @JsonKey(name: "label")
  final String? label;

  ActiveGamesTurn({
    this.games,
    this.label,
  });

  ActiveGamesTurn copyWith({
    List<GameModel>? games,
    String? label,
  }) =>
      ActiveGamesTurn(
        games: games ?? this.games,
        label: label ?? this.label,
      );

  factory ActiveGamesTurn.fromJson(Map<String, dynamic> json) =>
      _$ActiveGamesTurnFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveGamesTurnToJson(this);
}
