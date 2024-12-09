import 'package:json_annotation/json_annotation.dart';
part 'game_model.g.dart';

@JsonSerializable()
class GameModel {
  @JsonKey(name: "game_id")
  final String? gameId;
  @JsonKey(name: "game_status")
  final String? gameStatus;
  @JsonKey(name: "last_move_time")
  final double? lastMoveTime;
  @JsonKey(name: "opponent_name")
  final String? opponentName;
  @JsonKey(name: "opponent_profile_pic")
  final String? opponentProfilePic;
  @JsonKey(name: "squares_played")
  final int? squaresPlayed;
  @JsonKey(name: "this_players_turn")
  final bool? thisPlayersTurn;

  GameModel({
    this.gameId,
    this.gameStatus,
    this.lastMoveTime,
    this.opponentProfilePic,
    this.opponentName,
    this.squaresPlayed,
    this.thisPlayersTurn,
  });

  GameModel copyWith({
    String? gameId,
    String? gameStatus,
    double? lastMoveTime,
    String? opponentName,
    String? opponentProfilePic,
    int? squaresPlayed,
    bool? thisPlayersTurn,
  }) =>
      GameModel(
        gameId: gameId ?? this.gameId,
        gameStatus: gameStatus ?? this.gameStatus,
        lastMoveTime: lastMoveTime ?? this.lastMoveTime,
        opponentName: opponentName ?? this.opponentName,
        opponentProfilePic: opponentProfilePic ?? this.opponentProfilePic,
        squaresPlayed: squaresPlayed ?? this.squaresPlayed,
        thisPlayersTurn: thisPlayersTurn ?? this.thisPlayersTurn,
      );

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameModelToJson(this);
}
