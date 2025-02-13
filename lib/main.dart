import 'package:flutter/material.dart';
import 'package:pinterest_flutter/constants/colors.dart';
import 'pages/nav.dart';
import 'pages/home/home.dart';
import 'pages/search/search.dart';
import 'pages/profile/profile.dart';
import 'pages/messages/inbox/chat.dart';
import 'pages/add/add_college.dart';
import 'pages/home/home_nav.dart';
import 'pages/home/aesthetic.dart';
import 'pages/login&signup/landing_page.dart';
import 'pages/login&signup/signup.dart';

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
          MaterialPageRoute(builder: (context) => const PinterestLandingPage()),
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
            'assets/pinterest.png',
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
    HomeContainer(), // Wrapper for HomePage & AestheticPage
    SearchPage(),
    AddCollegeScreen(),
    NewMessageScreen(),
    ProfileScreen(),
    PinterestLandingPage(),
    SignUpPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double appBarHeight = (_selectedIndex == 1 ||
            _selectedIndex == 4 ||
            _selectedIndex == 3 ||
            _selectedIndex == 2)
        ? 0
        : 60;

    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

/// HomeContainer to properly handle switching between HomePage & AestheticPage
class HomeContainer extends StatefulWidget {
  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onHomeNavTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: [
            HomePage(),
            AestheticPage(), // Add AestheticPage here
          ],
        ),
        HomeNavBar(
          onPageChanged: _onHomeNavTapped, 
          currentIndex: _currentIndex,
        ),
      ],
    );
  }
}
