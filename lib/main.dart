import 'package:flutter/material.dart';
import 'package:pinterest_flutter/constants/colors.dart';
import 'pages/nav.dart';
import 'pages/home.dart';
import 'pages/search.dart';
import 'pages/profile.dart';
import 'pages/messages/inbox/chat.dart';
import 'pages/add/add_college.dart';
import 'pages/add/add_board.dart';
import 'pages/add/text.dart';
import 'pages/add/pins.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _logoAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _logoAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -7),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()),
        );
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Center(
        child: SlideTransition(
          position: _logoAnimation,
          child: Image.asset(
            'assets/pinterest.png', // Splash image
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    AddCollegeScreen(),
    NewMessageScreen(),
    ProfileScreen(),
    TextEditorScreen(),
    AddBoardScreen(),
    PinsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = 50;

    if (_selectedIndex == 1 ||
        _selectedIndex == 4 ||
        _selectedIndex == 3 ||
        _selectedIndex == 2) {
      appBarHeight = 0; // Hide the AppBar completely
    } else if (_selectedIndex == 0) {
      appBarHeight = 60; // Slightly taller for the search bar
    }

    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      appBar: appBarHeight > 0
          ? PreferredSize(
              preferredSize: Size.fromHeight(appBarHeight),
              child: AppBar(
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "All",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    Column(
                      children: [
                        const Text(
                          "Aesthetic",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class AddCollegeScreen extends StatefulWidget {
  final List<String> imagePaths = [
    'assets/1.jpg',
    'assets/37.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/38.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/39.jpg',
    'assets/6.jpg',
    'assets/7.jpg',
    'assets/8.jpg',
    'assets/9.jpg',
    'assets/10.jpg',
    'assets/11.jpg',
    'assets/12.jpg',
    'assets/13.jpg',
    'assets/14.jpg',
    'assets/15.jpg',
    'assets/16.jpg',
    'assets/17.jpg',
    'assets/18.jpg',
    'assets/19.jpg',
    'assets/20.jpg',
    'assets/21.jpg',
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

  void _undo() {
    setState(() {
      if (_paths.isNotEmpty) {
        _redoStack.add(_paths.removeLast());
      }
    });
  }

  void _redo() {
    setState(() {
      if (_redoStack.isNotEmpty) {
        _paths.add(_redoStack.removeLast());
      }
    });
  }

  void _showPenOptions() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.brush, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      _selectedPenType = PenType.brush;
                    });
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.text_fields, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      _selectedPenType = null;
                    });
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.create, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      _selectedPenType = PenType.pen;
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                          Rect.fromLTWH(16, 16,
                              MediaQuery.of(context).size.width - 32, 60),
                          Rect.fromCenter(
                            center: Offset(
                              MediaQuery.of(context).size.width / 2,
                              MediaQuery.of(context).size.height / 2,
                            ),
                            width: 300,
                            height: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
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
                      size: Size
                          .infinite, // Allows the paint area to expand indefinitely
                      painter: DrawingPainter(
                        paths: _paths,
                        color: _selectedColor,
                        strokeWidth: _penStrokeWidth,
                      ),
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
                              icon:
                                  const Icon(Icons.close, color: Colors.black),
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
                              icon: const Icon(Icons.more_horiz,
                                  color: Colors.black),
                              onPressed: _showPenOptions,
                            ),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward,
                                  color: Colors.black),
                              onPressed: () {
                                // Add navigation functionality
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
        ],
      ),
    );
  }
}

class DottedBackgroundPainter extends CustomPainter {
  final List<Rect> excludeRects;

  const DottedBackgroundPainter({required this.excludeRects});

  @override
  void paint(Canvas canvas, Size size) {
    // Your dotted background implementation
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DrawingPainter extends CustomPainter {
  final List<Path> paths;
  final Color color;
  final double strokeWidth;

  const DrawingPainter({
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

    for (final path in paths) {
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
