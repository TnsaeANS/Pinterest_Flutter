import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
    'assets/7.jpg',
    'assets/8.jpg',
    'assets/9.jpg',
    'assets/10.jpg',
    'assets/11.jpg',
    'assets/12.jpg',    
    'assets/13.jpg',
    'assets/14.jpg',
    'assets/15.jpg',
    'assets/16.jpg',
    'assets/17.jpg',
    'assets/18.jpg',
    'assets/19.jpg',
    'assets/20.jpg',
    'assets/21.jpg',
  ];

   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}