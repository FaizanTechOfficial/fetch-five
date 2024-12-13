import 'package:json_annotation/json_annotation.dart';

part 'game_details_model.g.dart';

@JsonSerializable()
class GameDetailModel {
  @JsonKey(name: "game_status", defaultValue: 'unknown')
  final String? gameStatus;

  @JsonKey(name: "last_move_time", defaultValue: 0.0)
  final double? lastMoveTime;

  @JsonKey(name: "opponents_last_square", defaultValue: 0)
  final int opponentsLastSquare;

  @JsonKey(name: "player_hand", defaultValue: [])
  final List<int>? playerHand;

  @JsonKey(name: "player_one_card_count", defaultValue: 0)
  final int? playerOneCardCount;

  @JsonKey(name: "player_one_last_card", defaultValue: null)
  final dynamic playerOneLastCard;

  @JsonKey(name: "player_one_name", defaultValue: '')
  final String? playerOneName;

  @JsonKey(name: "player_one_profile_pic", defaultValue: '')
  final String? playerOneProfilePic;

  @JsonKey(name: "player_one_squares", defaultValue: [])
  final List<int>? playerOneSquares;

  @JsonKey(name: "player_two_card_count", defaultValue: 0)
  final int? playerTwoCardCount;

  @JsonKey(name: "player_two_last_card", defaultValue: null)
  final dynamic playerTwoLastCard;

  @JsonKey(name: "player_two_name", defaultValue: '')
  final String? playerTwoName;

  @JsonKey(name: "player_two_profile_pic", defaultValue: '')
  final String? playerTwoProfilePic;

  @JsonKey(name: "player_two_squares", defaultValue: [])
  final List<int>? playerTwoSquares;

  @JsonKey(name: "this_player", defaultValue: '')
  final String? thisPlayer;

  @JsonKey(name: "this_players_turn", defaultValue: false)
  final bool? thisPlayersTurn;

  GameDetailModel({
    this.gameStatus = 'unknown',
    this.lastMoveTime = 0.0,
    this.opponentsLastSquare = 0,
    this.playerHand = const [],
    this.playerOneCardCount = 0,
    this.playerOneLastCard,
    this.playerOneName = '',
    this.playerOneProfilePic = '',
    this.playerOneSquares = const [],
    this.playerTwoCardCount = 0,
    this.playerTwoLastCard,
    this.playerTwoName = '',
    this.playerTwoProfilePic = '',
    this.playerTwoSquares = const [],
    this.thisPlayer = '',
    this.thisPlayersTurn = false,
  });

  factory GameDetailModel.fromJson(Map<String, dynamic> json) =>
      _$GameDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameDetailModelToJson(this);
}
