import 'package:flutter/material.dart';
import 'package:pinterest_flutter/pages/add/text.dart';
import 'package:pinterest_flutter/pages/add/add.dart';

enum PenType { pencil, brush, pen }

class AddCollegeScreen extends StatefulWidget {
  final List<String> imagePaths = [
    'assets/1.jpg', 'assets/2.jpg', 'assets/3.jpg', 'assets/4.jpg',
    // Add more asset paths as needed
  ];

  AddCollegeScreen({super.key});

  @override
  State<AddCollegeScreen> createState() => _AddCollegeScreenState();
}

class _AddCollegeScreenState extends State<AddCollegeScreen> {
  final List<Path> _paths = [];
  final List<Path> _redoStack = [];
  Color _selectedColor = Colors.black;
  double _penStrokeWidth = 4.0;
  PenType? _selectedPenType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 17),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: DottedBackgroundPainter(
                        excludeRects: [
                          
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onPanStart: (details) {
                      setState(() {
                        final path = Path();
                        path.moveTo(details.localPosition.dx, details.localPosition.dy);
                        _paths.add(path);
                      });
                    },
                    onPanUpdate: (details) {
                      setState(() {
                        _paths.last.lineTo(details.localPosition.dx, details.localPosition.dy);
                      });
                    },
                    child: CustomPaint(
                      size: Size.infinite,
                      painter: DrawingPainter(paths: _paths, color: _selectedColor, strokeWidth: _penStrokeWidth),
                    ),
                  ),
                  Positioned(
                    top: 25,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.close, color: Colors.black),
                              onPressed: () => Navigator.pop(context),
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
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.more_horiz, color: Colors.black),
                              onPressed: _showPenOptions,
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
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.brush), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.text_fields), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: ''),
        ],
        onTap: (index) {
          if (index == 0) {
            _showPenOptions();
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TextEditorScreen()));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddScreen()));
          }
        },
      ),
    );
  }

  void _changePenColor(Color color) => setState(() => _selectedColor = color);

  void _undo() {
    if (_paths.isNotEmpty) {
      setState(() {
        final lastPath = _paths.removeLast();
        _redoStack.add(lastPath);
      });
    }
  }

  void _redo() {
    if (_redoStack.isNotEmpty) {
      setState(() {
        final lastUndonePath = _redoStack.removeLast();
        _paths.add(lastUndonePath);
      });
    }
  }

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
                  onTap: () => setState(() => _selectedPenType = penType),
                  child: Column(
                    children: [
                      Icon(_getPenIcon(penType), size: 36.0),
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
              onChanged: (value) => setState(() => _penStrokeWidth = value),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getPenIcon(PenType penType) {
    switch (penType) {
      case PenType.brush:
        return Icons.brush;
      case PenType.pencil:
        return Icons.edit;
      case PenType.pen:
        return Icons.create;
      default:
        return Icons.create;
    }
  }
}

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
      ..style = PaintingStyle.stroke;

    for (final path in paths) {
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) {
    return oldDelegate.paths != paths ||
        oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}

class DottedBackgroundPainter extends CustomPainter {
  final List<Rect> excludeRects;

  DottedBackgroundPainter({required this.excludeRects});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final dotSpacing = 19.0;
    for (double y = 0; y < size.height; y += dotSpacing) {
      for (double x = 0; x < size.width; x += dotSpacing) {
        final dot = Offset(x, y);
        if (excludeRects.any((rect) => rect.contains(dot))) {
          continue;
        }
        canvas.drawCircle(dot, 1.0, paint);
      }
    }
  }

  @override
  bool shouldRepaint(DottedBackgroundPainter oldDelegate) {
    return oldDelegate.excludeRects != excludeRects;
  }
}

extension OffsetExtensions on Offset {
  Offset normalize() {
    final double length = this.distance;
    if (length == 0) return Offset.zero;
    return this / length;
  }
}
