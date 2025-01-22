import 'package:flutter/material.dart';
import 'package:pinterest_flutter/constants/colors.dart';
import 'pages/nav.dart';
import 'pages/home.dart';
import 'pages/search.dart';
import 'pages/profile.dart';
import 'pages/chat.dart';
import 'pages/add/add_college.dart';
import 'pages/add/text.dart';


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

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
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
  TextEditorScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
Widget build(BuildContext context) {
 double appBarHeight = 50;

    if (_selectedIndex == 1 || _selectedIndex == 4 || _selectedIndex == 3 || _selectedIndex == 2) {
      appBarHeight = 0; // Hide the AppBar completely
    } else if (_selectedIndex == 0) { // Search page
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
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4), // Space between text and underline
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
              const SizedBox(width: 20), 
              Column(
                children: [
                  const Text(
                    "Board",
                    style: TextStyle(
                      fontSize: 20,
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
    : null, // No AppBar if height is 0 // No AppBar if height is 0
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
 