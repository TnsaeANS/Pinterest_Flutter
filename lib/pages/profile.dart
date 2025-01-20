import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_flutter/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/40.jpg',
    'assets/41.jpg',
    'assets/42.png',
    'assets/43.jpg',
    'assets/44.png',
    'assets/45.png',
    'assets/46.jpg',
    'assets/47.jpg',
    'assets/48.jpg',
    'assets/49.jpg',
    'assets/50.jpg',
    'assets/51.jpg',
    'assets/52.jpg',
    'assets/53.jpg',
    'assets/54.jpg',
    'assets/55.jpg',
    'assets/56.jpg',
    'assets/57.jpg',
    'assets/58.jpg',
    'assets/59.jpg',
    'assets/60.jpg',
    'assets/61.jpg',
    'assets/1.jpg',
    'assets/37.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/38.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/39.jpg',
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

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                // Handle the icon tap
                print("Profile icon tapped");
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
                radius: 15,
              ),
            ),
            const SizedBox(width: 80),
            Column(
              children: [
                const Text(
                  "Pins",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 35,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 25),
            Column(
              children: [
                const Text(
                  "Boards",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: MainColor.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            // First Row
            SizedBox(
              width: 380,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search for ideas',
                          prefixIcon: Icon(Icons.search,
                              color: const Color.fromARGB(234, 90, 90, 90)),
                          hintStyle: TextStyle(
                              fontSize: 15,
                              color: const Color.fromARGB(94, 228, 228, 228)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(28, 218, 218, 218),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10), // Optional spacing
                    const Icon(Icons.add,
                        size: 40, color: Color.fromARGB(255, 255, 255, 255)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Second Row
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 15),
                // Favorites Button
                Container(
                  width: 60,
                  height: 47,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.5,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.grid_view_rounded,
                        color: Colors.white, 
                        size: 35, 
                      ),
                      SizedBox(width: 2),
                    ],
                  ),
                ),
                const SizedBox(width: 5), 
                Container(
                  width: 105, 
                  height: 47, 
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white, 
                      width: 0.5, 
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.star, 
                        color: Colors.white, 
                        size: 23, 
                      ),
                      SizedBox(width: 2), 
                      Text(
                        'Favourites',
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 13, 
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  width: 110,
                  height: 47,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.5,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(width: 2),
                      Text(
                        'Created by you', // Change the text for the new button
                        style: TextStyle(
                          color: Colors.white, // Text color for the new button
                          fontSize: 13, // Text size for the new button
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            // Masonry Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: MasonryGridView.builder(
                physics: const NeverScrollableScrollPhysics(), 
                shrinkWrap: true, // Ensure grid fits within its parent
                gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
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
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}