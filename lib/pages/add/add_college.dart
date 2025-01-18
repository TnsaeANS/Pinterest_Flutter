import 'package:flutter/material.dart';
import 'package:pinterest_flutter/pages/add/text.dart';

enum PenType {
  pencil,
  brush,
  pen,
}

class AddCollegeScreen extends StatefulWidget {
  const AddCollegeScreen({super.key});

  @override
  State<AddCollegeScreen> createState() => _AddCollegeScreenState();
}

class _AddCollegeScreenState extends State<AddCollegeScreen> {
  final List<Path> _paths = []; // Stores drawn paths
  final List<Path> _redoStack = []; // Stores paths for redo
  Color _selectedColor = Colors.black; // Default pen color
  double _penStrokeWidth = 4.0; // Default pen stroke width
  PenType? _selectedPenType; // Selected pen type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Thick border around the edges
          Container(
            margin: const EdgeInsets.only(
                bottom: 0), // Adjusted space for the BottomNavigationBar
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black, width: 17), // Thick border styling
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
                          Rect.fromLTWH(
                              16,
                              16,
                              MediaQuery.of(context).size.width - 32,
                              60), // Top icons area
                          Rect.fromCenter(
                            center: Offset(
                                MediaQuery.of(context).size.width / 2,
                                MediaQuery.of(context).size.height / 2),
                            width: 300,
                            height: 100, // Add College text area
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Drawing Canvas
                  GestureDetector(
                    onPanStart: (details) {
                      setState(() {
                        final path = Path();
                        path.moveTo(
                            details.localPosition.dx, details.localPosition.dy);
                        _paths.add(path);
                      });
                    },
                    onPanUpdate: (details) {
                      setState(() {
                        _paths.last.lineTo(
                            details.localPosition.dx, details.localPosition.dy);
                      });
                    },
                    child: CustomPaint(
                      size: Size.infinite,
                      painter: DrawingPainter(
                          paths: _paths,
                          color: _selectedColor,
                          strokeWidth: _penStrokeWidth),
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
                              icon:
                                  const Icon(Icons.close, color: Colors.black),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.undo, color: Colors.black),
                              onPressed: _undo,
                            ),
                            IconButton(
                              icon: const Icon(Icons.redo, color: Colors.black),
                              onPressed: _redo,
                            ),
                          ],
                        ),
                        // Right Buttons: Options and Arrow
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.more_horiz,
                                  color: Colors.black),
                              onPressed: _showPenOptions,
                            ),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward,
                                  color: Colors.black),
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
        onTap: (index) {
          if (index == 0) {
            _showPenOptions(); // Call the method to show the options
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TextEditorScreen()),
            );
          }
          // Handle other index cases if needed
        },
      ),
    );
  }

  // Change Pen Type
  void _changePenType(PenType type) {
    setState(() {
      _selectedPenType = type;
    });
  }

  // Change Pen Color
  void _changePenColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  // Undo the last path
  void _undo() {
    if (_paths.isNotEmpty) {
      setState(() {
        final lastPath = _paths.removeLast();
        _redoStack.add(lastPath);
      });
    }
  }

  // Redo the last undone path
  void _redo() {
    if (_redoStack.isNotEmpty) {
      setState(() {
        final lastUndonePath = _redoStack.removeLast();
        _paths.add(lastUndonePath);
      });
    }
  }

  // Show Pen Options
  void _showPenOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 250,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _changePenColor(Colors.black),
                  child: CircleAvatar(backgroundColor: Colors.black),
                ),
                GestureDetector(
                  onTap: () => _changePenColor(Colors.red),
                  child: CircleAvatar(backgroundColor: Colors.red),
                ),
                GestureDetector(
                  onTap: () => _changePenColor(Colors.blue),
                  child: CircleAvatar(backgroundColor: Colors.blue),
                ),
                GestureDetector(
                  onTap: () => _changePenColor(Colors.green),
                  child: CircleAvatar(backgroundColor: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: PenType.values.map((penType) {
                return GestureDetector(
                  onTap: () => _changePenType(penType),
                  child: Column(
                    children: [
                      Icon(
                        _getPenIcon(penType),
                        size: 36.0,
                      ),
                      Text(penType.name.toUpperCase()),
                    ],
                  ),
                );
              }).toList(),
            ),
            Slider(
              value: _penStrokeWidth,
              min: 2.0,
              max: 10.0,
              onChanged: (value) {
                setState(() {
                  _penStrokeWidth = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  IconData _getPenIcon(PenType penType) {
    switch (penType) {
      case PenType.brush:
        return Icons.brush;// Brush icon
      case PenType.pencil:
        return Icons.edit; // Pencil icon
      case PenType.pen:
        return Icons.edit; // Pen icon
      default:
        return Icons.create; // Default icon
    }
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

// Custom Painter for Drawing
class DrawingPainter extends CustomPainter {
  final List<Path> paths;
  final Color color;
  final double strokeWidth;

  DrawingPainter({
    required this.paths,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    for (var path in paths) {
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
