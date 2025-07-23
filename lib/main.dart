import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/provider/room_data_provider.dart';
import 'package:tictactoe/screens/create_room_screen.dart';
import 'package:tictactoe/screens/game_screen.dart';
import 'package:tictactoe/screens/join_room_screen.dart';
import 'package:tictactoe/screens/main_menu_screen.dart';
import 'package:tictactoe/screens/wait_screen.dart';
import 'package:tictactoe/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) { 
        return RoomDataProvider();
       },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
        routes: {
          MainMenuScreen.routeName: (_)=> MainMenuScreen(),
              JoinRoomScreen.routeName: (_)=> JoinRoomScreen(),
                  CreateRoomScreen.routeName: (_)=> CreateRoomScreen(),
                  GameScreen.routeName: (_)=> GameScreen(),
                  WaitScreen  .routeName: (_)=> WaitScreen(),
        },
        // home: const MainMenuScreen(),
        initialRoute: MainMenuScreen.routeName,
      ),
    );
  }
}
