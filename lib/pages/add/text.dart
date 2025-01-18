import 'package:flutter/material.dart';

class TextEditorScreen extends StatefulWidget {
  @override
  _TextEditorScreenState createState() => _TextEditorScreenState();
}

class _TextEditorScreenState extends State<TextEditorScreen> {
  double _fontSize = 20.0; // Default font size
  String _text = ''; // Text content

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Close editor
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Done action
            },
            child: const Text(
              "Done",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: 400.0, // Set a fixed width
                height: 400.0, // Set a fixed height
                decoration: BoxDecoration(
                  color: Colors.white, // Set background color to white
                  borderRadius:
                      BorderRadius.circular(10.0), // Add border radius
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal:
                        16.0), // Optional: Add padding for better spacing
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _text = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Type something...",
                    hintStyle: TextStyle(
                      fontSize: _fontSize,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                    ),
                    border: InputBorder.none, // Remove default border
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 170.0), // Center the text vertically
                  ),

                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: _fontSize,
                      color: Colors.black), // Black text for visibility
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Aa",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Expanded(
                  child: Slider(
                    value: _fontSize,
                    min: 10.0,
                    max: 50.0,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                    onChanged: (value) {
                      setState(() {
                        _fontSize = value;
                      });
                    },
                  ),
                ),
                Icon(Icons.circle, color: Colors.white, size: 16),
              ],
            ),
          ),
          const Divider(color: Colors.white, thickness: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(Icons.more_horiz, "Options"),
                _buildActionButton(Icons.brush, "Replace"),
                _buildActionButton(Icons.copy, "Duplicate"),
                _buildActionButton(Icons.delete, "Delete"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.white),
          onPressed: () {
            // Action based on button type
          },
        ),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
