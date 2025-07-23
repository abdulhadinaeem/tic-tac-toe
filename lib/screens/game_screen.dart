import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/screens/wait_screen.dart';

class GameScreen extends StatelessWidget {
  static String routeName = 'game-screen';
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final roomDataProvider = Provider.of<RoomDataProvider>(context,);
    print(Provider.of<RoomDataProvider>(context, listen: false).player1.nickname);
    print(Provider.of<RoomDataProvider>(context, listen: false).player2.nickname);
    return Scaffold(
      body:roomDataProvider.roomData['isJoin']?WaitScreen(): Center(
        child: Text(
          'Game Screen',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}