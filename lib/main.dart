import 'package:flutter/material.dart';
import 'package:pinterest_flutter/constants/colors.dart';
import 'pages/nav.dart';
import 'pages/home/home.dart';
import 'pages/search.dart';
import 'pages/profile.dart';
import 'pages/messages/inbox/chat.dart';
import 'pages/add/add_college.dart';
import 'pages/home/home_nav.dart';

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
      body: Stack(
        children: [
          _pages[_selectedIndex],
          if (_selectedIndex == 0) const HomeNavBar(), // Show only on HomePage
        ],
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
