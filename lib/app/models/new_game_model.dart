import 'package:json_annotation/json_annotation.dart';
part 'new_game_model.g.dart';

@JsonSerializable()
class NewGameModel {
  @JsonKey(name: "game_id")
  final String? gameId;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "status")
  final String? status;

  NewGameModel({
    this.gameId,
    this.message,
    this.status,
  });

  NewGameModel copyWith({
    String? gameId,
    String? message,
    String? status,
  }) =>
      NewGameModel(
        gameId: gameId ?? this.gameId,
        message: message ?? this.message,
        status: status ?? this.status,
      );

  factory NewGameModel.fromJson(Map<String, dynamic> json) =>
      _$NewGameModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewGameModelToJson(this);
}
