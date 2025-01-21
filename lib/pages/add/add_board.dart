import 'package:flutter/material.dart';

class AddBoardScreen extends StatefulWidget {
  const AddBoardScreen({super.key});

  @override
  _AddBoardScreenState createState() => _AddBoardScreenState();
}

class _AddBoardScreenState extends State<AddBoardScreen> {
  final TextEditingController _boardNameController = TextEditingController();
  bool _isSecret = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A), // Darker gray background
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close,
              color: Color.fromARGB(255, 210, 210, 210)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Create Board',
          style: TextStyle(
            color: Color.fromARGB(255, 215, 213, 213),
            fontSize: 15, // Adjusted font size
          ),
        ),
        centerTitle: true, // Center the title in the AppBar
        backgroundColor: const Color(0xFF1A1A1A),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(
                  255, 197, 18, 5), // Red color for the button
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text('Next', style: TextStyle(color: Colors.white)),
            onPressed: () {
              // Next button functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Board name',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 10), // Reduced space before TextField
            Container(
              height: 40, // Height of the input field
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A), // Very dark gray
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white), // White border
              ),
              child: TextField(
                controller: _boardNameController,
                decoration: const InputDecoration(
                  hintText: "Add a title such as 'DIY' or 'Recipes'",
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none, // Remove the default border
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8), // Adjust vertical padding
                ),
                maxLength: 50,
                style: const TextStyle(color: Colors.white), // Text color
              ),
            ),

            const SizedBox(height: 20), // Add space after TextField
            const Text(
              'Collaborators',
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 215, 213, 213)),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                          'assets/10.jpg'), // Replace with an actual image
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'John Doe',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 215, 213, 213)),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 31, 31, 31),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: Colors.white),
                    ),
                  ),
                  child:
                      const Text('Add', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    // Add button functionality
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 40, // Set the size of the circular background
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey, // Gray background color
                        shape: BoxShape.circle, // Circular shape
                      ),
                    ),
                    const Icon(Icons.person,
                        size: 24, color: Colors.white), // Centered user icon
                    Positioned(
                      bottom: 2, // Adjust position of the add icon
                      right: 2,
                      child: Container(
                        width: 16, // Smaller circle for the add icon
                        height: 16,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 176, 174,
                              174), // Red background for the add icon
                          shape: BoxShape.circle, // Circular shape
                        ),
                        child: const Icon(Icons.add,
                            size: 12,
                            color: Colors.white), // Add icon inside the circle
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                const Text(
                  'Add collaborators',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 215, 213, 213)),
                ),
              ],
            ),
            const SizedBox(
                height:
                    50), // Space between Add collaborators and Visibility section

            // Visibility section
            const Text('Visibility',
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 215, 213, 213))),
            const SizedBox(
                height: 10), // Space between Visibility and secret text

            // Row to place the switch and text side by side
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Keep this board secret',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 215, 213, 213)),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    value: _isSecret,
                    onChanged: (bool value) {
                      setState(() {
                        _isSecret = value;
                      });
                    },
                    activeColor: const Color.fromARGB(
                        255, 245, 238, 238), // Red switch color
                    inactiveTrackColor: const Color.fromARGB(255, 15, 12, 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'If you don\'t want others to see this board, keep it secret',
              style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 215, 213, 213)),
            ),
          ],
        ),
      ),
    );
  }
}
