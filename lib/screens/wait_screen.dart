import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/provider/room_data_provider.dart';

class WaitScreen extends StatefulWidget {
  static String routeName = 'wait-screen';
  const WaitScreen({super.key});

  @override
  State<WaitScreen> createState() => _WaitScreenState();
}

class _WaitScreenState extends State<WaitScreen> {
  String? roomId;

  @override
  void initState() {
    super.initState();
    roomId =
        Provider.of<RoomDataProvider>(context, listen: false).roomData['_id'];
  }

  void _copyRoomId() {
    if (roomId != null) {
      Clipboard.setData(ClipboardData(text: roomId??""));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Room ID copied to clipboard!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Optional: dark background for style
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Waiting for players to join...',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              'Room ID: $roomId',
              style: TextStyle(fontSize: 18, color: Colors.grey[300]),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _copyRoomId,
              icon: Icon(Icons.copy),
              label: Text('Copy Room ID'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
