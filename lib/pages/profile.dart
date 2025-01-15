import 'package:flutter/material.dart';
import 'package:pinterest_flutter/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  "All",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4), 
                Container(
                  width: 40,
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
                  "Board",
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
                          prefixIcon: Icon(Icons.search, color: const Color.fromARGB(234, 90, 90, 90)),
                          hintStyle: TextStyle(fontSize: 15, color: const Color.fromARGB(94, 228, 228, 228)),
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
                    const Icon(Icons.add, size: 40, color: Color.fromARGB(255, 255, 255, 255)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),            

            // Second Row
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Center the row
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
                      children: [
                        const Icon(
                          Icons.grid_view_rounded,
                          color: Colors.white, // Icon color
                          size: 35, // Icon size
                        ),
                        const SizedBox(width: 2), 
                      ],
                    ),
                  ),
                  const SizedBox(width: 5), // Space between the buttons
                  Container(
                    width: 105, // Set your desired width for the new button
                    height: 47, // Set your desired height for the new button
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.white, // Border color for the new button
                        width: 0.5, // Border width for the new button
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star, // Change this to your desired icon
                          color: Colors.white, // Icon color for the new button
                          size: 23, // Icon size for the new button
                        ),
                        const SizedBox(width: 2), // Space between icon and text
                        const Text(
                          'Favourites', // Change the text for the new button
                          style: TextStyle(
                            color: Colors.white, // Text color for the new button
                            fontSize: 13, // Text size for the new button
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
              Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Center the row
                children: [
                  // Favorites Button
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
                      children: [
                        const SizedBox(width: 2), // Space between icon and text
                        const Text(
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
            ),
          ],
        ),
      ),
        ],)
      ),);
      }
}

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
  ));
}