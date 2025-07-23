class Players {
  final String nickname;
  final String socketId;
  final double points;
  final String playerType;

  Players({
    required this.nickname,
    required this.socketId,
    required this.points,
    required this.playerType,
  });

  // From JSON
  factory Players.fromJson(Map<String, dynamic> json) {
    return Players(
      nickname: json['nickname'] as String,
      socketId: json['socketId'] as String,
      points: (json['points'] as num).toDouble(),
      playerType: json['playerType'] as String,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
      'socketId': socketId,
      'points': points,
      'playerType': playerType,
    };
  }

  // Optional: copyWith
  Players copyWith({
    String? nickname,
    String? socketId,
    double? points,
    String? playerType,
  }) {
    return Players(
      nickname: nickname ?? this.nickname,
      socketId: socketId ?? this.socketId,
      points: points ?? this.points,
      playerType: playerType ?? this.playerType,
    );
  }
}
