import 'package:flutter/material.dart';
import 'package:tictactoe/screens/create_room_screen.dart';
import 'package:tictactoe/screens/join_room_screen.dart';
import 'package:tictactoe/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName= 'main-menu';
  const MainMenuScreen({super.key});
void createRoom(BuildContext context){
  Navigator.pushNamed(context, CreateRoomScreen.routeName);
}
void joinRoom(BuildContext context){
  Navigator.pushNamed(context, JoinRoomScreen.routeName);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton(text: 'Create Room', onTap: (){
            createRoom(context);
          }),
          SizedBox(height: 20,),
          CustomButton(text: 'Join Room', onTap: (){
            joinRoom(context);
          })
        ],
      )
    );
  }
}