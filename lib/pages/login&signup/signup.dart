import 'package:flutter/material.dart';
import 'package:pinterest_flutter/main.dart';
import 'package:pinterest_flutter/pages/home/home.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 23, 23),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/pinterest.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(height: 20),
                Text(
                  'Welcome to Pinterest',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Find new ideas to try',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                _buildTextField('Email'),
                const SizedBox(height: 10),
                _buildTextField('Create a password', isPassword: true),
                const SizedBox(height: 10),
                _buildTextField('Age', keyboardType: TextInputType.number),
                const SizedBox(height: 20),
                _buildContinueButton(context),
                const SizedBox(height: 20),
                const Text('OR', style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 20),
                _buildSocialButton('Continue with Facebook', Colors.blue, Icons.facebook),
                const SizedBox(height: 10),
                _buildSocialButton('Continue with Google', Colors.grey, Icons.g_mobiledata),
                const SizedBox(height: 20),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'By continuing, you agree to Pinterest\'s ',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(color: Color.fromARGB(255, 255, 0, 0), fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      TextSpan(
                        text: ' and acknowledge you\'ve read our ',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      TextSpan(
                        text: 'Privacy Policy.',
                        style: TextStyle(color: Color.fromARGB(255, 255, 0, 0), fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Go back to login
                  },
                  child: const Text(
                    'Already a member? Log in',
                    style: TextStyle(color: Color.fromARGB(255, 255, 0, 0), fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          // Add navigation to business account sign-up here
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          color: const Color.fromARGB(255, 35, 35, 35),
          child: const Text(
            'Create a business account',
            style: TextStyle(color: Color.fromARGB(255, 237, 226, 226), fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool isPassword = false, TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      obscureText: isPassword,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),  
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),  
        filled: true,
        fillColor: const Color.fromARGB(255, 58, 56, 56),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainScreen()), 
        );
      },
      child: const Text(
        'Continue',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  Widget _buildSocialButton(String text, Color color, IconData icon) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      icon: Icon(icon, color: Colors.white),
      onPressed: () {},
      label: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
