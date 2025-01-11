import 'package:flutter/material.dart';
import 'package:pinterest_flutter/constants/colors.dart';
import 'pages/nav.dart';
import 'pages/home.dart'; 
import 'pages/search.dart';  
import 'pages/add.dart';
import 'pages/profile.dart';
import 'pages/chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(), // Start with SplashScreen
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
      end: const Offset(0, -19),
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
      backgroundColor: MainColor.primaryColor,
      body: Center(
        child: SlideTransition(
          position: _logoAnimation,
          child: Image.asset(
            'assets/pinterest.png',  // Splash image
            width: 100,
            height: 100,
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
  int _selectedIndex = 0; // Keep track of the selected tab index

  // Pages to display
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    AddScreen(),
    ChatScreen(),
    ProfileScreen(),
    // Add more pages as needed
  ];

  // Function to handle item selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: MainColor.primaryColor,
    appBar: PreferredSize(
      preferredSize: const Size.fromHeight(50), // Adjust height as needed
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          "All",
          style: TextStyle(
            fontSize: 20, // Adjust font size
            decoration: TextDecoration.underline, // Underline the text
            decorationColor: Colors.white,
            color: Color.fromARGB(255, 255, 252, 252), // Set text color
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
