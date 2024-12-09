import 'package:fetch_five/app/models/games_model.dart';
import 'package:fetch_five/app/models/player_info_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'dashboard_game_model.g.dart';

@JsonSerializable()
class DashboardGameModel {
  @JsonKey(name: "games")
  final GamesModel? games;
  @JsonKey(name: "player_info")
  final PlayerInfoModel? playerInfo;

  DashboardGameModel({
    this.games,
    this.playerInfo,
  });

  DashboardGameModel copyWith({
    GamesModel? games,
    PlayerInfoModel? playerInfo,
  }) =>
      DashboardGameModel(
        games: games ?? this.games,
        playerInfo: playerInfo ?? this.playerInfo,
      );

  factory DashboardGameModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardGameModelFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardGameModelToJson(this);
}
