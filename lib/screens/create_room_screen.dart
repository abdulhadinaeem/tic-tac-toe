import 'package:flutter/material.dart';
import 'package:tictactoe/resources/socket_methods.dart';
import 'package:tictactoe/utils/colors.dart';
import 'package:tictactoe/widgets/custom_button.dart';
import 'package:tictactoe/widgets/custom_textfield.dart';


class CreateRoomScreen extends StatefulWidget {
    static String routeName ='create-room';
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _roomNameController = TextEditingController();
final SocketMethods _socketMethods = SocketMethods();
  @override
  void dispose() {
    _roomNameController.dispose();
    super.dispose();
  }
@override
  void initState() {
   _socketMethods.createRoomSuccess(context);
    _socketMethods.errorOccurredListener(context);
    super.initState();
  }
  void _createRoom() {
    final roomName = _roomNameController.text.trim();
    if (roomName.isNotEmpty) {
      print('Room created: $roomName');
      _socketMethods.createRoom(roomName);
      // Add your logic here
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a room name')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      appBar: AppBar(
        title: const Text('Create Room'),
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
              'Enter Room Name',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            CustomTextField(
              hintText: 'e.g. Flutter Developers',
              controller: _roomNameController,
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Create Room',
              onTap: _createRoom,
            ),
          ],
        ),
      ),
    );
  }
}
