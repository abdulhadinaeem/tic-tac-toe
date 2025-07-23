import 'package:flutter/material.dart';
import 'package:tictactoe/resources/socket_methods.dart';
import 'package:tictactoe/utils/colors.dart';
import 'package:tictactoe/widgets/custom_button.dart';
import 'package:tictactoe/widgets/custom_textfield.dart';


class JoinRoomScreen extends StatefulWidget {
  static String routeName='join-room';
  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _gameIdController = TextEditingController();
final SocketMethods _socketMethods = SocketMethods();
  @override
  void dispose() {
    _nicknameController.dispose();
    _gameIdController.dispose();
    super.dispose();
  }
@override
  void initState() {
   _socketMethods.joinRoomSuccess(context);
    _socketMethods.errorOccurredListener(context);
    _socketMethods.updatePlayersDataLisner(context);
    super.initState();
  }
  void _joinRoom() {
    final nickname = _nicknameController.text.trim();
    final gameId = _gameIdController.text.trim();

    if (nickname.isEmpty || gameId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }
_socketMethods.joinRoom(gameId, nickname);
    print('Joining room with Nickname: $nickname and Game ID: $gameId');
    // Implement your join logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Join Room'),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nickname',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'Enter your nickname',
              controller: _nicknameController,
            ),
            const SizedBox(height: 20),
            const Text(
              'Game ID',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'Enter game ID',
              controller: _gameIdController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Join Room',
              onTap: _joinRoom,
            ),
          ],
        ),
      ),
    );
  }
}
