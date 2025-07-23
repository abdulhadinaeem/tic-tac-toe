import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/resources/socket_client.dart';
import 'package:tictactoe/screens/game_screen.dart';
import 'package:tictactoe/screens/join_room_screen.dart';

class SocketMethods {

  final _socket = SocketClient.instance.socket!;
  void createRoom(String nickname) {
    log( 'Creating room with nickname: $nickname');
    if (nickname.isNotEmpty) {
      _socket.emit('createRoom', {'nickname': nickname});
    }
  }
  void createRoomSuccess(BuildContext context) {
    _socket.on('roomCreated', (room){
      log('Room created successfully: $room');
   Provider.of<RoomDataProvider>(context, listen: false).updateRoomData(room);
     
Navigator.pushNamed(context, GameScreen.routeName);
    });
  }

  void joinRoom(String roomId, String nickname) {
    log('Joining room: $roomId with nickname: $nickname');
    if (roomId.isNotEmpty && nickname.isNotEmpty) {
      _socket.emit('joinRoom', {'roomId': roomId, 'nickname': nickname});
    }
  }
   void joinRoomSuccess(BuildContext context) {
    _socket.on('roomJoined', (room){
      log('Room created successfully: $room');
   Provider.of<RoomDataProvider>(context, listen: false).updateRoomData(room);
     
Navigator.pushNamed(context, GameScreen.routeName);
    });
  }
  void errorOccurredListener(BuildContext context) {
    _socket.on('error', (error) {
      log('Error occurred: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    });
  }

  void updatePlayersDataLisner(BuildContext context) {
    _socket.on('updatePlayersData', (data) {
      log('Players data updated: $data');
      Provider.of<RoomDataProvider>(context, listen: false).updatePlayer1(data[0]);
            Provider.of<RoomDataProvider>(context, listen: false).updatePlayer2(data[1]);
    });
  }
}
