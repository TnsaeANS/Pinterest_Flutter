import 'package:flutter/material.dart';
import 'chat_detail_screen.dart';
class ChatDetailScreen extends StatefulWidget {
  final String contactName;

  const ChatDetailScreen({super.key, required this.contactName});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.contactName),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.contactName,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "This could be the beginning of something good",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Quick Reply Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _quickReplyButton("Hello!"),
                _quickReplyButton("👋"),
                _quickReplyButton("Hey!"),
                _quickReplyButton("😊"),
                _quickReplyButton("How are you?"),
              ],
            ),
          ),

          const Spacer(),

          // Message Input Section
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.white),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    onChanged: (text) {
                      setState(() {}); // Rebuild to update the icon
                    },
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: _controller.text.isEmpty
                      ? const Icon(Icons.favorite, color: Colors.red) // Heart icon when the input is empty
                      : const Icon(Icons.send, color: Colors.blue), // Send icon when there's text
                  onPressed: _controller.text.isEmpty
                      ? () {}
                      : () {
                          // Handle message sending action
                          print("Message Sent: ${_controller.text}");
                          _controller.clear(); // Clear text after sending
                        },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Quick reply button widget
  Widget _quickReplyButton(String text) {
    return GestureDetector(
      onTap: () {
        // You can define what should happen when the quick reply button is tapped
        print('Quick reply: $text');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
