import 'package:json_annotation/json_annotation.dart';
part 'available_players_model.g.dart';

@JsonSerializable()
class AvailablePlayers {
  @JsonKey(name: "human_players", defaultValue: [])
  List<Player>? humanPlayers;
  @JsonKey(name: "robot_players", defaultValue: [])
  List<Player>? robotPlayers;

  AvailablePlayers({
    this.humanPlayers,
    this.robotPlayers,
  });

  factory AvailablePlayers.fromJson(Map<String, dynamic> json) =>
      _$AvailablePlayersFromJson(json);

  Map<String, dynamic> toJson() => _$AvailablePlayersToJson(this);
}

@JsonSerializable()
class Player {
  @JsonKey(name: "player_id", defaultValue: '')
  String? playerId;
  @JsonKey(name: "player_name", defaultValue: '')
  String? playerName;
  @JsonKey(name: "profile_pic", defaultValue: '')
  String? profilePic;

  Player({
    this.playerId,
    this.playerName,
    this.profilePic,
  });

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
