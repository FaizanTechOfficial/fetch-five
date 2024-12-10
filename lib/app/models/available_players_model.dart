import 'package:json_annotation/json_annotation.dart';
part 'available_players_model.g.dart';

@JsonSerializable()
class AvailablePlayers {
  @JsonKey(name: "human_players")
  List<Player> humanPlayers;
  @JsonKey(name: "robot_players")
  List<Player> robotPlayers;

  AvailablePlayers({
    required this.humanPlayers,
    required this.robotPlayers,
  });

  factory AvailablePlayers.fromJson(Map<String, dynamic> json) =>
      _$AvailablePlayersFromJson(json);

  Map<String, dynamic> toJson() => _$AvailablePlayersToJson(this);
}

@JsonSerializable()
class Player {
  @JsonKey(name: "player_id")
  String playerId;
  @JsonKey(name: "player_name")
  String playerName;
  @JsonKey(name: "profile_pic")
  String profilePic;

  Player({
    required this.playerId,
    required this.playerName,
    required this.profilePic,
  });

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
