import 'package:flutter/material.dart';

class AddCollegeScreen extends StatelessWidget {
  const AddCollegeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Thick border around the edges
          Container(
            margin: const EdgeInsets.only(bottom: 0), // Adjusted space for the BottomNavigationBar
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 17), // Thick border styling
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Inner border radius
              child: Stack(
                children: [
                  // Dotted background
                  Positioned.fill(
                    child: CustomPaint(
                      painter: DottedBackgroundPainter(
                        excludeRects: [
                          Rect.fromLTWH(16, 16, MediaQuery.of(context).size.width - 32, 60), // Top icons area
                          Rect.fromCenter(
                            center: Offset(
                                MediaQuery.of(context).size.width / 2, MediaQuery.of(context).size.height / 2),
                            width: 300,
                            height: 100, // Add College text area
                          ),
                        ],
                      ),
                    ),
                  ),
                  // App Bar Section
                  Positioned(
                    top: 25,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left Buttons: Back, Undo, Redo
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.close, color: Colors.black),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.undo, color: Colors.black),
                              onPressed: () {
                                // Undo functionality
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.redo, color: Colors.black),
                              onPressed: () {
                                // Redo functionality
                              },
                            ),
                          ],
                        ),
                        // Right Buttons: Options and Arrow
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.more_horiz, color: Colors.black),
                              onPressed: () {
                                // Options functionality
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward, color: Colors.black),
                              onPressed: () {
                                // Arrow functionality
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Center Content
                  Center(
                    child: Text(
                      'Add College',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.brush), // Sketching Icon
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields), // 'T' Icon
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add), // '+' Icon
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image), // Image Icon
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt), // Camera Icon
            label: '',
          ),
        ],
      ),
    );
  }
}

// Custom Painter for Dotted Background
class DottedBackgroundPainter extends CustomPainter {
  final List<Rect> excludeRects;

  DottedBackgroundPainter({required this.excludeRects});

  @override
  void paint(Canvas canvas, Size size) {
    var dotPaint = Paint()
      ..color = const Color.fromARGB(255, 168, 167, 167) // Black dots
      ..style = PaintingStyle.fill;

    const dotSpacing = 30.0;
    const dotRadius = 2.0;

    for (double x = 0; x < size.width; x += dotSpacing) {
      for (double y = 0; y < size.height; y += dotSpacing) {
        final dotPosition = Offset(x, y);
        
        canvas.drawCircle(dotPosition, dotRadius, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
