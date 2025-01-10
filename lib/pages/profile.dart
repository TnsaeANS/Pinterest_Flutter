import 'package:flutter/material.dart';
import 'package:pinterest_flutter/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(
        child: Text(
          'This is the Profile Screen',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
