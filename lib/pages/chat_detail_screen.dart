import 'package:flutter/material.dart';

class ChatDetailScreen extends StatefulWidget {
  final String contactName;

  const ChatDetailScreen({super.key, required this.contactName});

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateSendButton);
  }

  @override
  void dispose() {
    _controller.removeListener(_updateSendButton);
    _controller.dispose();
    super.dispose();
  }

  void _updateSendButton() {
    setState(() {}); // Triggers UI update when text changes
  }

  @override
  Widget build(BuildContext context) {
    bool isTyping = _controller.text.isNotEmpty;

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
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                // Add button (unchanged)
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.white),
                  onPressed: () {},
                ),
                // Input Field
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.black,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.white, width: 1.5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Heart or Send Button (changes dynamically)
                GestureDetector(
                  onTap: isTyping
                      ? () {
                          print("Message Sent: ${_controller.text}");
                          _controller.clear();
                        }
                      : () {}, // No action for heart button
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: isTyping ? Colors.white : Colors.black,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      isTyping ? Icons.send : Icons.favorite,
                      color: isTyping ? Colors.black : Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
