import 'package:flutter/material.dart';
import 'package:pinterest_flutter/constants/colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      appBar: AppBar(title: const Text('Chat')),
      body: const Center(
        child: Text(
          'This is the Chat Screen',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
