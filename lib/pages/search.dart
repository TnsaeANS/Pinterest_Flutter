import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: screenWidth,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.camera_alt),

                  border: OutlineInputBorder(
                  
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(40), 
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
