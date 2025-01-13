import 'package:flutter/material.dart';
import 'package:pinterest_flutter/constants/colors.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const NavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: MainColor.primaryColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      selectedItemColor: MainColor.secondaryColor, // Use the red from MainColor
      unselectedItemColor: MainColor.accentColor, // Use white from MainColor
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: '',
        ),
        BottomNavigationBarItem(
  icon: CircleAvatar(
    backgroundImage: AssetImage(
      'assets/profile.png',
    ),
    radius: 15, // Adjust this value to control the size of the CircleAvatar
  ),
  label: '',
)

      ],
    );
  }
}
