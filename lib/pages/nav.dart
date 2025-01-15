import 'package:flutter/material.dart';
import 'package:pinterest_flutter/constants/colors.dart';
import 'package:pinterest_flutter/pages/add/add_college.dart';



class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  void _showAddOptions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,  // This will allow for a custom modal height
      backgroundColor: Colors.grey[900],  // Dark gray background
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          constraints: BoxConstraints(maxHeight: 200),  // Decrease the height of the popup
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row containing the close button and the centered text
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Close button
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  // Centered Text
                  Expanded(
                    child: Center(
                      child: const Text(
                        'Start creating now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,  // Adjust font size for better fit
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Options below the text
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Pin Button with black background and rounded edges
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,  // Black background
                          borderRadius: BorderRadius.circular(8),  // Rounded edges
                        ),
                        padding: const EdgeInsets.all(12),
                        child: IconButton(
                          icon: const Icon(Icons.push_pin, color: Colors.white),
                          onPressed: () {
                            
                          },
                        ),
                      ),
                      const SizedBox(height: 8), // Space between icon and text
                      const Text('Pin', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  // Collage Button with black background and rounded edges
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,  // Black background
                          borderRadius: BorderRadius.circular(8),  // Rounded edges
                        ),
                        padding: const EdgeInsets.all(12),
                        child: IconButton(
                          icon: const Icon(Icons.photo_library, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddCollegeScreen()), // Navigate to add_collage page
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 8), // Space between icon and text
                      const Text('Collage', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  // Board Button with black background and rounded edges
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,  // Black background
                          borderRadius: BorderRadius.circular(8),  // Rounded edges
                        ),
                        padding: const EdgeInsets.all(12),
                        child: IconButton(
                          icon: const Icon(Icons.dashboard, color: Colors.white),
                          onPressed: () {
                            
                          },
                        ),
                      ),
                      const SizedBox(height: 8), // Space between icon and text
                      const Text('Board', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: MainColor.primaryColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: (index) {
        if (index == 2) { // The index for the Add button
          _showAddOptions(context);
        } else {
          onItemTapped(index);
        }
      },
      selectedItemColor: MainColor.secondaryColor, // Use the red from MainColor
      unselectedItemColor: MainColor.accentColor, // Use white from MainColor
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: CircleAvatar(
            backgroundImage: AssetImage('assets/profile.png'),
            radius: 15, // Adjust this value to control the size of the CircleAvatar
          ),
          label: '',
        ),
      ],
    );
  }
}
