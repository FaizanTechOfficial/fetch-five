import 'package:json_annotation/json_annotation.dart';
part 'player_info_model.g.dart';

@JsonSerializable()
class PlayerInfoModel {
  @JsonKey(name: "player_name")
  final String? playerName;
  @JsonKey(name: "player_profile_pic")
  final String? playerProfilePic;

  PlayerInfoModel({
    this.playerName,
    this.playerProfilePic,
  });

  PlayerInfoModel copyWith({
    String? playerName,
    String? playerProfilePic,
  }) =>
      PlayerInfoModel(
        playerName: playerName ?? this.playerName,
        playerProfilePic: playerProfilePic ?? this.playerProfilePic,
      );

  factory PlayerInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerInfoModelToJson(this);
}
