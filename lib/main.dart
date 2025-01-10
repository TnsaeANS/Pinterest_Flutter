import 'package:flutter/material.dart';
import 'pages/nav.dart';
import 'pages/home.dart'; 
import 'pages/search.dart';  
import 'Pages/profile.dart';

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
      duration: const Duration(seconds: 4),
    );

    _logoAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -10),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward().then((value) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainScreen()), // Navigate to MainScreen after splash
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: Center(
        child: SlideTransition(
          position: _logoAnimation,
          child: Image.asset(
            'assets/pinterest.png',  // Splash image
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

  // Pages to display
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    ProfileScreen(),
    // Add more pages as needed
  ];

  // Function to handle item selection
  void _onItemTapped(int index) {
    if (index < _pages.length) { 
      setState(() {
        _selectedIndex = index; // Update the selected index
      });
    }
  }

  @override
Widget build(BuildContext context) {
 double appBarHeight = 50;

    if (_selectedIndex == 2) { // Profile page
      appBarHeight = 0; // Hide the AppBar completely
    } else if (_selectedIndex == 1) { // Search page
      appBarHeight = 60; // Slightly taller for the search bar
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: Container(
          alignment: Alignment.center,
          child: (_selectedIndex == 1) ? null : const Text(
            "All",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: Colors.black,
          ),
        ),
      ),
    ),
    body: _pages[_selectedIndex], // Display the selected page
    bottomNavigationBar: NavBar(
      selectedIndex: _selectedIndex,
      onItemTapped: _onItemTapped,
    ),
  );
}

}
