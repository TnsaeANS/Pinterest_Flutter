// search.dart
import 'package:flutter/material.dart';
import 'package:pinterest_flutter/constants/colors.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: const Center(
        child: Text('Search Page Content'),

      ),
    );
  }
}
