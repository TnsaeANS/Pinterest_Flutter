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
            const SizedBox(height: 10),
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
                    const SizedBox(width: 10), // Optional spacing between the text field and the icon
                    const Icon(Icons.add, size: 40, color: Color.fromARGB(255, 255, 255, 255)),
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