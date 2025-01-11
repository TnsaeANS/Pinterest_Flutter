import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    List<String> imagePaths = [
      'assets/22.jpg',
      'assets/23.jpg',
      'assets/24.jpg',
      'assets/25.jpg',
      'assets/26.jpg',
      'assets/27.jpg',
      'assets/28.jpg'
    ];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: screenWidth,
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                style: TextStyle(fontSize: 17, color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Search for ideas',
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                  suffixIcon: Icon(Icons.camera_alt, color: Colors.grey.shade400),
                  hintStyle: TextStyle(fontSize: 18, color: Colors.grey.shade500),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(117, 223, 223, 223),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Ideas for you",
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Expanded(
            child: MasonryGridView.builder(
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Image.asset(imagePaths[index], fit: BoxFit.cover),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
