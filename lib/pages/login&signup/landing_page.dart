import 'package:flutter/material.dart';
import 'package:pinterest_flutter/main.dart';
import 'package:pinterest_flutter/pages/login&signup/signup.dart';
import 'package:pinterest_flutter/pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PinterestLandingPage(),
    );
  }
}

class PinterestLandingPage extends StatelessWidget {
  const PinterestLandingPage({super.key});

  void _showLoginPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Log in',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildLoginButton('Continue with Facebook',
                const Color.fromARGB(255, 19, 98, 162)),
            const SizedBox(height: 10),
            _buildLoginButton('Continue with Google',
                const Color.fromARGB(255, 24, 124, 170)),
            const SizedBox(height: 10),
            _buildLoginButton('Continue with Apple', Colors.white,
                isApple: true),
            const SizedBox(height: 20),
            const Text(
              'OR',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildTextField('Enter your email'),
            const SizedBox(height: 10),
            _buildPasswordField(),
            const SizedBox(height: 20),
            _buildLoginButton('Log in', Colors.red, onPressed: () {
              Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MainScreen()), 
                        );
              Navigator.pop(context);// Close popup after login
            }),
            const SizedBox(height: 10),
            const Text(
              'Forgot your password?',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 5),
            _buildSignUpSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton(String text, Color color,
      {bool isApple = false, VoidCallback? onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed ?? () {}, // Default empty onPressed if not provided
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isApple)
            const Icon(Icons.apple, color: Colors.black)
          else
            const SizedBox.shrink(),
          if (isApple) const SizedBox(width: 10) else const SizedBox.shrink(),
          Text(
            text,
            style: TextStyle(
              color: isApple ? Colors.black : Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); // Close the login popup
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const SignUpPage()), // Navigate to sign-up page
        );
      },
      child: const Text(
        'Sign Up',
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[800],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      obscureText: true,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Enter your password',
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[800],
        suffixIcon: const Icon(Icons.visibility, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Background Images
            Positioned(
              top: 40,
              left: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/14.jpg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 215,
              left: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/43.jpg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/46.jpg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 215,
              right: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/45.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 140,
              left: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/36.jpeg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Main Content
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/pinterest.png',
                      width: 79,
                      height: 79,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Create the life you love on Pinterest',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SignUpPage()), // Navigate to sign-up page
                        );
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[800],
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () => _showLoginPopup(context),
                      child: const Text(
                        'Log in',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'By continuing, you agree to Pinterest\'s Terms of Service and acknowledge you\'ve read our Privacy Policy. Notice at collection.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
