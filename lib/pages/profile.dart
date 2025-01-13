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
            const SizedBox(width: 10), 
            GestureDetector(
              onTap: () {
                // Handle the icon tap
                print("Profile icon tapped");
                // You can navigate to another page or perform any action here
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
                radius: 15, // Adjust this value to control the size of the CircleAvatar
              ),
            ),
            const SizedBox(width: 80), // Space after the avatar
            Column(
              children: [
                
                const Text(
                  "All",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4), // Space between text and underline
                Container(
                  width: 40, // Adjust width as needed
                  height: 4,  // Thickness of the underline
                  decoration: BoxDecoration(
                    color: Colors.white, // Color of the underline
                    borderRadius: BorderRadius.circular(2), // Rounded corners
                  ),
                ),
              ],
            ),
            const SizedBox(width: 40), 
            Column(
              children: [
                const Text(
                  "Board",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 5), 
                // Container(
                //   width: 40, // Adjust width as needed
                //   height: 4,  // Thickness of the underline
                //   decoration: BoxDecoration(
                //     color: Colors.white, // Color of the underline
                //     borderRadius: BorderRadius.circular(2), // Rounded corners
                //   ),
                // ),
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
            const SizedBox(height: 10), // Space below the AppBar
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search for ideas',
                    prefixIcon: Icon(Icons.search, color: const Color.fromARGB(234, 90, 90, 90)),
                    suffixIcon: Icon(Icons.camera_alt, color: const Color.fromARGB(234, 90, 90, 90)),
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
            ),
          ],
        ),
      ),
    );
  }
}