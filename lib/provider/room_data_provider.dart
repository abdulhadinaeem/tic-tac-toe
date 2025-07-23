import 'package:flutter/material.dart';
import 'package:tictactoe/models/players.dart';

class RoomDataProvider extends ChangeNotifier {
  Map<String, dynamic> _roomData = {};
  Map<String, dynamic> get roomData => _roomData;
  Players _player1 = Players(
    nickname: '',
    socketId: '',
    points: 0.0,
    playerType: 'X',
  );
  Players _player2 = Players(
    nickname: '',
    socketId: '',
    points: 0.0,
    playerType: 'O',
  );
  Players get player1 => _player1;
  Players get player2 => _player2;
  void updatePlayer1(Map<String, dynamic> player) {
    _player1 = Players.fromJson(player);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> player) {
    _player2 = Players.fromJson(player);
    notifyListeners();
  }

  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }
}
