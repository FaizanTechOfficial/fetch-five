// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'available_players_model.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// AvailablePlayers _$AvailablePlayersFromJson(Map<String, dynamic> json) =>
//     AvailablePlayers(
//       humanPlayers: (json['human_players'] as List<dynamic>?)
//               ?.map((e) => Player.fromJson(e as Map<String, dynamic>))
//               .toList() ??
//           [],
//       robotPlayers: (json['robot_players'] as List<dynamic>?)
//               ?.map((e) => Player.fromJson(e as Map<String, dynamic>))
//               .toList() ??
//           [],
//     );

// Map<String, dynamic> _$AvailablePlayersToJson(AvailablePlayers instance) =>
//     <String, dynamic>{
//       'human_players': instance.humanPlayers,
//       'robot_players': instance.robotPlayers,
//     };

// Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
//       playerId: json['player_id'] as String? ?? '',
//       playerName: json['player_name'] as String? ?? '',
//       profilePic: json['profile_pic'] as String? ?? '',
//     );

// Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
//       'player_id': instance.playerId,
//       'player_name': instance.playerName,
//       'profile_pic': instance.profilePic,
//     };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_players_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailablePlayers _$AvailablePlayersFromJson(Map<String, dynamic> json) =>
    AvailablePlayers(
      humanPlayers: (json['human_players'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      robotPlayers: (json['robot_players'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Player.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AvailablePlayersToJson(AvailablePlayers instance) =>
    <String, dynamic>{
      'human_players': instance.humanPlayers,
      'robot_players': instance.robotPlayers,
    };

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      playerId: json['player_id'] as String?,
      playerName: json['player_name'] as String?,
      profilePic: json['profile_pic'] as String?,
    );

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'player_id': instance.playerId,
      'player_name': instance.playerName,
      'profile_pic': instance.profilePic,
    };
